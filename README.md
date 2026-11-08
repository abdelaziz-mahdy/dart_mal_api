# mal_api_plus

A Dart wrapper for the official [MyAnimeList API v2](https://myanimelist.net/apiconfig/references/api/v2), with automatic OAuth2 token refresh.

## Credits

This package is a maintained continuation of [`mal_api`](https://pub.dev/packages/mal_api) by [Hingen](https://gitlab.com/hingen/dart_mal_api), who wrote the original wrapper. `mal_api` has not been updated since 2022 and does not support Dart 3, so this package carries it forward with Dart 3 support and token refresh. The original MIT license and copyright are kept in `LICENSE`.

Coming from `mal_api`? Swap the dependency and change the import to `package:mal_api_plus/mal_api_plus.dart`. Nothing else changes.

## Installation

```bash
dart pub add mal_api_plus
```

## Tests and Examples

To run the example in the `example` directory, ensure that the following environment variables are set:
- `CLIENT_ID` - obtained after registering your application at [MAL's API Config](https://myanimelist.net/apiconfig)
- `CLIENT_SECRET` - obtained after registering your application at [MAL's API Config](https://myanimelist.net/apiconfig)
- `REDIRECT_URL` - the URL to redirect to after oauth2 authentication (must be specified in the `App Redirect URL` field at [MAL's API Config](https://myanimelist.net/apiconfig))

To run the tests in the `test` directory, ensure that the following environment variables are set:
- `CREDENTIALS` - JSON string containing your oauth2 credentials (generated and stored in the `creds.json` file when `example/mal_api_plus_example.dart` is run)
- `CLIENT_ID` - obtained after registering your application at [MAL's API Config](https://myanimelist.net/apiconfig)
- `CLIENT_SECRET` - obtained after registering your application at [MAL's API Config](https://myanimelist.net/apiconfig)

Before running the tests, do note that some test will make modifications to your anime and manga list.

## Getting Started

To start making request to the MyAnimeList API, you will need a `Client` object. A `Client` object can be obtained by calling `Authenticator::authenticate()`. Refer to the example for more information.

At any point in time, if a request to the MyAnimeList API fails, a `ClientException` will be thrown.

Most `Client` methods have a `fields` parameter. Certain `Fields` can also have sub-`Fields`. This is use to specify which fields the MyAnimeList API should return. Certain fields are always returned by the API. However, to ensure that the field you need will be returned, specify it explicitly. Note that even if a field is explicitly specified, there are times (e.g. missing information) where the field will not be returned. Thus, make sure to check for `null` values.

## Example

See `example/mal_api_plus_example.dart`.

## License
Distributed under the MIT License. See `LICENSE` for more information.

## Relevant Materials
[MyAnimeList API Authorization Documentation](https://myanimelist.net/apiconfig/references/authorization)

[MyAnimeList API Documentation](https://myanimelist.net/apiconfig/references/api/v2)

[MyAnimeList API Config](https://myanimelist.net/apiconfig)

[MyAnimeList API License and Developer Agreement](https://myanimelist.net/static/apiagreement.html)
