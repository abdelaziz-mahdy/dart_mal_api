import 'dart:io';
import 'dart:math';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:mal_api/mal_api.dart';

/// Handles oauth2 authentication for the application.
class Authenticator {
  static const _codeChallengeLength = 128;
  static const _charset =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';

  static final Uri _authEndpoint =
      Uri.parse('https://myanimelist.net/v1/oauth2/authorize');
  static final Uri _tokenEndpoint =
      Uri.parse('https://myanimelist.net/v1/oauth2/token');

  final File _credentialsFile;
  final String _id;
  final String _secret;
  final Uri _redirectUrl;

  final Future<void> Function(Uri) _redirect;
  final Future<Uri> Function(Uri) _listen;
  final Future<bool> Function()? _onTokenRefreshNeeded;

  /// Authenticates the application associated with [id] and [secret].
  ///
  /// During the authentication process, [redirect] is called with the
  /// authentication URL and is meant to redirect the user to the authentication
  /// webpage.
  ///
  /// [listen] is then called with the [redirectUrl] and is meant to listen for
  /// authentication completion. Upon which it is to return the full redirected
  /// URL.
  ///
  /// If [credentialsFile] contains valid authentication credentials, the
  /// authentication process is skipped. Otherwise, upon authentication
  /// completion, the generated authentication credentials are written to
  /// [credentialsFile].
  ///
  /// [onTokenRefreshNeeded] is an optional callback that gets invoked when
  /// the authentication token needs to be refreshed. This callback should return
  /// `true` to proceed with the refresh, or `false` to skip it. This allows you
  /// to show warnings or confirmation dialogs to the user before refreshing.
  Authenticator(
      {required File credentialsFile,
      required String id,
      required Future<Uri> Function(Uri) listen,
      required Future<void> Function(Uri) redirect,
      required Uri redirectUrl,
      required String secret,
      Future<bool> Function()? onTokenRefreshWarning})
      : _credentialsFile = credentialsFile,
        _id = id,
        _secret = secret,
        _redirectUrl = redirectUrl,
        _redirect = redirect,
        _listen = listen,
        _onTokenRefreshWarning = onTokenRefreshWarning;

  /// Authenticate the user
  Future<Client?> authenticate() async {
    return await _authenticateCredentials() ?? await _authenticateNew();
  }

  Future<Client?> _authenticateCredentials() async {
    if (!await _credentialsFile.exists()) {
      return null;
    }

    late final String credentialsStr;
    try {
      credentialsStr = await _credentialsFile.readAsString();
    } on FileSystemException {
      print('Failed to read credentials file.');
      return null;
    }

    late final oauth2.Credentials credentials;
    try {
      credentials = oauth2.Credentials.fromJson(credentialsStr);
    } on FormatException {
      print('Invalid credentials.');
      return null;
    }

    // Create an oauth2 client with the loaded credentials
    final client = oauth2.Client(credentials,
        identifier: _id,
        secret: _secret,
        onCredentialsRefreshed: _onCredentialsRefreshed);

    // Attempt to refresh the token if it's expired
    try {
      await refreshTokenIfExpired(client);
    } catch (e) {
      print('Failed to refresh credentials: $e');
      return null;
    }

    return Client(client);
  }

  Future<Client?> _authenticateNew() async {
    final codeChallenge = _createCodeChallenge();
    final grant = oauth2.AuthorizationCodeGrant(
        _id, _authEndpoint, _tokenEndpoint,
        codeVerifier: codeChallenge, secret: _secret);

    final authUrl = _getAuthUrl(grant, codeChallenge);

    await _redirect(authUrl);
    final resUrl = await _listen(_redirectUrl);

    return _handleAuthRes(resUrl, grant);
  }

  String _createCodeChallenge() {
    return List.generate(_codeChallengeLength,
        (i) => _charset[Random.secure().nextInt(_charset.length)]).join();
  }

  Uri _getAuthUrl(oauth2.AuthorizationCodeGrant grant, String codeChallenge) {
    // AuthorizationCodeGrant::getAuthorizationUrl utilises the 'S256' code
    // challenge method but MyAnimeList only supports the 'plain' method
    final authUrl = grant.getAuthorizationUrl(_redirectUrl);

    final queryParams = Map<String, String>.from(authUrl.queryParameters);
    queryParams['code_challenge'] = codeChallenge;
    queryParams['code_challenge_method'] = 'plain';

    return authUrl.replace(queryParameters: queryParams);
  }

  Future<Client?> _handleAuthRes(
      Uri resUrl, oauth2.AuthorizationCodeGrant grant) async {
    final params = resUrl.queryParameters;

    if (params.containsKey('code')) {
      final authClient = await grant.handleAuthorizationResponse(params);
      await _updateCredentialsFile(authClient);
      return Client(authClient);
    } else {
      return null;
    }
  }

  Future<void> _updateCredentialsFile(oauth2.Client client) async {
    try {
      await _credentialsFile.writeAsString(client.credentials.toJson());
    } on FileSystemException {
      print('Failed to write credentials to file.');
    }
  }

  /// Callback invoked when credentials are refreshed.
  /// Updates the credentials file with the new tokens.
  Future<void> _onCredentialsRefreshed(oauth2.Credentials credentials) async {
    try {
      await _credentialsFile.writeAsString(credentials.toJson());
      print('Credentials refreshed and updated in file.');
    } on FileSystemException {
      print('Failed to update credentials file after refresh.');
    }
  }

  /// Checks if the given [credentials] are expired.
  ///
  /// Returns `true` if the credentials have expired, `false` otherwise.
  bool isCredentialsExpired(oauth2.Credentials credentials) {
    return credentials.isExpired;
  }

  /// Refreshes the given [client]'s credentials if they are expired.
  ///
  /// If the credentials are expired, this method:
  /// 1. Invokes the [onTokenRefreshNeeded] callback if provided
  /// 2. Only proceeds with refresh if the callback returns `true` (or if no callback is set)
  /// 3. Updates the stored credentials file with the new tokens
  ///
  /// This allows you to show user warnings or confirmations before refreshing tokens.
  /// If the callback returns `false`, the refresh is skipped.
  ///
  /// Throws an exception if the refresh fails (e.g., network error, invalid credentials).
  Future<void> refreshTokenIfExpired(oauth2.Client client) async {
    if (isCredentialsExpired(client.credentials)) {
      final shouldRefresh = await _onTokenRefreshNeeded?.call() ?? true;
      if (shouldRefresh) {
        await client.refreshCredentials();
      }
    }
  }
}
