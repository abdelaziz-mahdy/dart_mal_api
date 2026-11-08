## 1.1.1

### Changed
- Add API documentation for `Anime`, `Manga`, their shared `Media` fields,
  `User`, user list entries, and `WatchStatus`/`ReadStatus`.
- Clean up all analyzer hints. No API changes.

## 1.1.0

First release as `mal_api_plus`, a maintained continuation of
[`mal_api`](https://pub.dev/packages/mal_api) by Hingen.

### Migration from `mal_api`
- Replace `mal_api` with `mal_api_plus` in `pubspec.yaml`.
- Replace `import 'package:mal_api/mal_api.dart';` with
  `import 'package:mal_api_plus/mal_api_plus.dart';`.
- No other API changes are needed.

### Added
- Refresh expired access tokens automatically using the stored refresh token,
  and save the new tokens back to the credentials file.
- `onTokenRefreshNeeded` callback on `Authenticator`, called when the refresh
  token itself has expired, to decide whether to sign the user in again.
- `httpClientWrapper` parameter on `Authenticator` to wrap the HTTP client
  (for example, with a logging interceptor).
- `Authenticator.refreshTokenIfExpired` and
  `Authenticator.isCredentialsExpired`.

### Changed
- Require Dart 3.
- Support `http` 1.x.
- Stop printing to the console when the credentials file cannot be read or
  written; `authenticate()` returns `null` instead.

## 1.0.1 (as `mal_api`)
- Implemented forum

## 1.0.0 (as `mal_api`)

- Initial version
