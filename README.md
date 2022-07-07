# MAL API

A Dart wrapper for the official MyAnimeList REST API.

## Tests and Examples

To run the example in the `example` directory, ensure that the following enviroment variables are set:
- `CLIENT_ID` - obtained after registering your application at [MAL's API CONFIG](https://myanimelist.net/apiconfig)
- `CLIENT_SECRET` - obtained after registering your application at [MAL's API CONFIG](https://myanimelist.net/apiconfig)
- `REDIRECT_URL` - the URL to redirect to after oauth2 authentication (must be specified in the `App Redirect URL` field at [MAL's API CONFIG](https://myanimelist.net/apiconfig))

To run the tests in the `test` directory, ensure that the following environment variables are set:
- `CREDENTIALS` - JSON string containing your oauth2 credentials (generated and stored in the `creds.json` file when `example/mal_api_example.dart` is runned)
- `CLIENT_ID` - obtained after registering your application at [MAL's API CONFIG](https://myanimelist.net/apiconfig)
- `CLIENT_SECRET` - obtained after registering your application at [MAL's API CONFIG](https://myanimelist.net/apiconfig)

## Getting Started

To start making request to the MyAnimeList API, you will need a `Client` object. A `Client` object can be obtained by calling `Authenticator::authenticate()`. Refer to the example for more information.

At any point in time, if a request to the MyAnimeList API fails, a `ClientException` will be thrown.

Most `Client` methods have a `fields` parameter. Certain `Fields` can also have sub-`Fields`. This is use to specify which fields the MyAnimeList API should return. Certain fields are always returned by the API. However, to ensure that the field you need will be returned, specify it explicitly. Note that even if a field is explicitly specified, there are times (e.g. missing information) where the field will not be returned. Thus, make sure to check for `null` values.

## Example

See `example/mal_api_example.dart`.

## Future Features

 - Forum

## License
Distributed under the MIT License. See `LICENSE` for more information.

## Relevant Materials
[MyAnimeList API Authorization Documentation](https://myanimelist.net/apiconfig/references/authorization)

[MyAnimeList API Documentation](https://myanimelist.net/apiconfig/references/api/v2)

[MyAnimeList API Config](https://myanimelist.net/apiconfig)

[MyAnimeList API License and Developer Agreement](https://myanimelist.net/static/apiagreement.html)
