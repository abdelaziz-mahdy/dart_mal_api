import 'dart:io';
import 'package:mal_api/mal_api.dart';

// Ensure that these environment variables have been set before running
final _id = Platform.environment['CLIENT_ID']!;
final _secret = Platform.environment['CLIENT_SECRET']!;
final _redirectUrl = Uri.parse(Platform.environment['REDIRECT_URL']!);

void main() async {
  // Authenticate the user
  final auth
    = Authenticator(
      credentialsFile: File('./creds.json'),
      id: _id,
      listen: _listen,
      redirect: _redirect,
      redirectUrl: _redirectUrl,
      secret: _secret,
    );
  final client = await auth.authenticate();

  if (client != null) {
    // Make request to the MyAnimeList API
    final animes
      = await client.getUserAnimeList(
        fields: [
          AnimeField.title(),
          AnimeField.myListStatus([UserAnimeListStatusField.score()])
        ]
      );
    final mangas
      = await client.getUserMangaList(
        fields: [
          MangaField.title(),
          MangaField.myListStatus([UserMangaListStatusField.score()])
        ]
      );

    print('\n--- My Anime List ---');
    for (final anime in animes) {
      print('${anime.title} | ${anime.myListStatus?.status} | ${anime.myListStatus?.score}');
    }

    print('\n--- My Manga List ---');
    for (final manga in mangas) {
      print('${manga.title} | ${manga.myListStatus?.status} | ${manga.myListStatus?.score}');
    }
  }
}

Future<Uri> _listen(Uri redirectUrl) async {
  stdout.writeln('Please enter the redirected URL upon allowing the requested permissions.');
  stdout.write('URL: ');
  final input = stdin.readLineSync();
  if (input != null && input.startsWith(redirectUrl.toString())) {
    return Uri.parse(input);
  } else {
    return Uri.parse('');
  }
}

Future<void> _redirect(Uri authUrl) async {
  stdout.writeln('Please visit the following URL in using your browser. Login and allow the requested permissions.');
  stdout.writeln('URL: ${authUrl.toString()}\n');
}
