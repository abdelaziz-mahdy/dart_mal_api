import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/factories/media_factories/anime_factory.dart';
import 'package:mal_api/src/utils/factories/media_factories/manga_factory.dart';
import 'package:mal_api/src/utils/factories/media_factories/media_factory.dart';
import 'package:mal_api/src/utils/factories/ranked_media_factories/ranked_anime_factory.dart';
import 'package:mal_api/src/utils/factories/ranked_media_factories/ranked_manga_factory.dart';
import 'package:mal_api/src/utils/factories/ranked_media_factories/ranked_media_factory.dart';
import 'package:mal_api/src/utils/factories/user_media_list_status_factories/user_anime_list_status_factory.dart';
import 'package:mal_api/src/utils/factories/user_media_list_status_factories/user_manga_list_status_factory.dart';
import 'package:mal_api/src/utils/factories/user_media_list_status_factories/user_media_list_status_factory.dart';

/// Handles MyAnimeList API requests.
///
/// Common parameters:
///
/// [fields] - Specify which fields the MyAnimeList API should return. By
/// default, certain fields are returned by the API. However, to ensure that the
/// field you need will be returned, specify it explicitly.
///
/// Note that a field may have one or more sub-fields which can also be
/// specified explicitly.
///
/// Also note that even if a field is explicitly specified, there are times
/// (e.g. missing information) where the field will not be returned. Thus, make
/// sure to check for null values.
///
/// [limit] - For methods that return a list, this limits the number of items
/// in the list.
///
/// [nsfw] - Specifies whether NSFW content should be returned.
///
/// [offset] - For methods that return a list, this specifies the page number to
/// be requested. For example, after requesting for 100 [Anime]s in a user's
/// anime list, specify an offset of 100 to get the next 100 [Anime]s.
class Client {
  static const String _authority = 'api.myanimelist.net';
  static const String _version = 'v2';

  final http.Client _client;

  /// Create a [Client] using an oauth2 authenticated [client].
  Client(http.Client client) : _client = client;

  /// Create a [Client] that will be authenticated using [credentialsJson],
  /// [id] and [secret].
  Client.fromJson({
    required String credentialsJson, required String id, required String secret
  }) : _client
      = oauth2
        .Client(
          oauth2.Credentials.fromJson(credentialsJson),
          identifier: id,
          secret: secret
        );

  /// Get a list of [Anime] matching the specified query [q].
  Future<List<Anime>> getAnimeList(
    String q, {
    List<AnimeField>? fields,
    int limit = 100,
    bool nsfw = false,
    int offset = 0
  }) async => (await _getMediaList(
    q,
    '/anime',
    const AnimeFactory(),
    fields: fields,
    limit: limit,
    nsfw: nsfw,
    offset: offset
  )).cast<Anime>();

  /// Get a list of [Manga] matching the specified query [q].
  Future<List<Manga>> getMangaList(
    String q, {
    List<MangaField>? fields,
    int limit = 100,
    bool nsfw = false,
    int offset = 0
  }) async => (await _getMediaList(
    q,
    '/manga',
    const MangaFactory(),
    fields: fields,
    limit: limit,
    nsfw: nsfw,
    offset: offset
  )).cast<Manga>();

  /// Get the [Anime] associated with [id].
  Future<Anime> getAnimeDetails(
    int id, {List<AnimeField>? fields, bool nsfw = false}
  ) async => await _getMediaDetails(
      id,
      '/anime',
      const AnimeFactory(),
      fields: fields,
      nsfw: nsfw
    ) as Anime;

  /// Get the [Manga] associated with [id].
  Future<Manga> getMangaDetails(
    int id, {List<MangaField>? fields, bool nsfw = false}
  ) async => await _getMediaDetails(
      id,
      '/manga',
      const MangaFactory(),
      fields: fields,
      nsfw: nsfw
    ) as Manga;

  /// Get a list of the top ranked [Anime]s ranked by [rankingType] along with
  /// their ranking information.
  Future<List<RankedAnime>> getAnimeRanking(
    AnimeRankingType rankingType, {
    List<AnimeRankingField>? fields,
    int limit = 100,
    bool nsfw = false,
    int offset = 0
  }) async => (await _getMediaRanking(
    rankingType.toParamStr(),
    '/anime',
    const RankedAnimeFactory(),
    fields: fields,
    limit: limit,
    nsfw: nsfw,
    offset: offset
  )).cast<RankedAnime>();

  /// Get a list of the top ranked [Manga]s ranked by [rankingType] along with
  /// their ranking information.
  Future<List<RankedManga>> getMangaRanking(
    MangaRankingType rankingType, {
    List<MangaRankingField>? fields,
    int limit = 100,
    bool nsfw = false,
    int offset = 0
  }) async => (await _getMediaRanking(
    rankingType.toParamStr(),
    '/manga',
    const RankedMangaFactory(),
    fields: fields,
    limit: limit,
    nsfw: nsfw,
    offset: offset
  )).cast<RankedManga>();

  /// Get a list of the [Anime]s belonging to the [season] and [year] sorted by
  /// [sort].
  Future<List<Anime>> getSeasonalAnime(
    int year,
    Season season, {
    List<AnimeField>? fields,
    int limit = 100,
    bool nsfw = false,
    int offset = 0,
    SeasonalAnimeSortingMethod sort = SeasonalAnimeSortingMethod.animeScore
  }) async {
    final params = {
      'fields': (fields ?? []).toParamStr(),
      'limit': limit.toString(),
      'nsfw': nsfw.toString(),
      'offset': offset.toString(),
      'sort': sort.toParamStr()
    };

    return (await _getIterable<Map<String, dynamic>>(
      '/anime/season/$year/${season.toParamStr()}', params
    )).map((data) => Anime.fromJsonMap(data['node'])).toList();
  }

  /// Get a list of [Anime]s suggested by MyAnimeList.
  Future<List<Anime>> getSuggestedAnime({
    List<AnimeField>? fields,
    int limit = 100,
    bool nsfw = false,
    int offset = 0
  }) async {
    final params = {
      'fields': (fields ?? []).toParamStr(),
      'limit': limit.toString(),
      'nsfw': nsfw.toString(),
      'offset': offset.toString()
    };

    return (await _getIterable<Map<String, dynamic>>(
      '/anime/suggestions', params
    )).map((data) => Anime.fromJsonMap(data['node'])).toList();
  }

  /// Update the user's [status] regarding the anime associated with [id].
  Future<UserAnimeListStatus> updateMyAnimeListStatus(
    int id, UserAnimeListStatus status
  ) async => (await _updateMyMediaListStatus(
    id, status, '/anime', const UserAnimeListStatusFactory()
  )) as UserAnimeListStatus;

  /// Update the user's [status] regarding the manga associated with [id].
  Future<UserMangaListStatus> updateMyMangaListStatus(
    int id, UserMangaListStatus status
  ) async => (await _updateMyMediaListStatus(
    id, status, '/manga', const UserMangaListStatusFactory()
  )) as UserMangaListStatus;

  /// Delete the user's entry for the anime associated with [id].
  Future<void> deleteMyAnimeListItem(int id) async
    => _deleteMyMediaListItem(id, '/anime');

  /// Delete the user's entry for the manga associated with [id].
  Future<void> deleteMyMangaListItem(int id) async
    => _deleteMyMediaListItem(id, '/manga');

  /// Get a list of [Anime]s in the list of the user with [username].
  ///
  /// A value of @me for [username] refers to the authenticated user.
  ///
  /// The [Anime]s are sorted by [sort].
  Future<List<Anime>> getUserAnimeList({
    List<AnimeField>? fields,
    int limit = 100,
    bool nsfw = false,
    int offset = 0,
    WatchStatus? status,
    UserAnimeListSortingMethod? sort,
    String username = '@me'
  }) async => (await _getUserMediaList(
    '/anime',
    const AnimeFactory(),
    fields: fields,
    limit: limit,
    nsfw: nsfw,
    offset: offset,
    status: status?.toParamStr(),
    sort: sort?.toParamStr(),
    username: username
  )).cast<Anime>();

  /// Get a list of [Manga]s in the list of the user with [username].
  ///
  /// A value of @me for [username] refers to the authenticated user.
  ///
  /// The [Manga]s are sorted by [sort].
  Future<List<Manga>> getUserMangaList({
    List<MangaField>? fields,
    int limit = 100,
    bool nsfw = false,
    int offset = 0,
    ReadStatus? status,
    UserMangaListSortingMethod? sort,
    String username = '@me'
  }) async => (await _getUserMediaList(
    '/manga',
    const MangaFactory(),
    fields: fields,
    limit: limit,
    nsfw: nsfw,
    offset: offset,
    status: status?.toParamStr(),
    sort: sort?.toParamStr(),
    username: username
  )).cast<Manga>();

  /// Get information about the user.
  Future<User> getUserInformation({List<UserField>? fields}) async {
    final params = {'fields': (fields ?? []).toParamStr()};
    return User
      .fromJsonMap(
        await _getDecoded<Map<String, dynamic>>('/users/@me', params)
      );
  }

  Future<List<Media>> _getMediaList(
    String q,
    String path,
    MediaFactory mediaFactory, {
    List<MediaField>? fields,
    required int limit,
    required bool nsfw,
    required int offset
  }) async {
    final params = {
      'q': q,
      'fields': (fields ?? []).toParamStr(),
      'limit': limit.toString(),
      'nsfw': nsfw.toString(),
      'offset': offset.toString()
    };

    return (await _getIterable<Map<String, dynamic>>(path, params))
      .map((data) => mediaFactory.fromJsonMap(data['node']))
      .toList();
  }

  Future<Media> _getMediaDetails(
    int id,
    String path,
    MediaFactory mediaFactory, {
    List<MediaField>? fields,
    required bool nsfw
  }) async {
    final params = {
      'fields': (fields ?? []).toParamStr(), 'nsfw': nsfw.toString()
    };

    return mediaFactory
      .fromJsonMap(
        await _getDecoded<Map<String, dynamic>>('$path/$id', params)
      );
  }

  Future<List<RankedMedia>> _getMediaRanking(
    String rankingType,
    String path,
    RankedMediaFactory rankedMediaFactory, {
    List<MediaRankingField>? fields,
    required int limit,
    required bool nsfw,
    required int offset
  }) async {
    final params = {
      'ranking_type': rankingType,
      'fields': (fields ?? []).toParamStr(),
      'limit': limit.toString(),
      'nsfw': nsfw.toString(),
      'offset': offset.toString()
    };

    return (await _getIterable<Map<String, dynamic>>('$path/ranking', params))
      .map(rankedMediaFactory.fromJsonMap)
      .toList();
  }

  Future<UserMediaListStatus> _updateMyMediaListStatus(
    int id,
    UserMediaListStatus status,
    String path,
    UserMediaListStatusFactory userMediaListStatusFactory
  ) async => userMediaListStatusFactory.fromJsonMap(
    await _patchDecoded<Map<String, dynamic>>(
      '$path/$id/my_list_status', status.toStrMap()
    )
  );

  Future<void> _deleteMyMediaListItem(int id, String path) async {
    await _req('$path/$id/my_list_status', {}, _client.delete);
  }

  Future<List<Media>> _getUserMediaList(
    String path,
    MediaFactory mediaFactory, {
    List<MediaField>? fields,
    required int limit,
    required bool nsfw,
    required int offset,
    String? status,
    String? sort,
    required String username
  }) async {
    final params = {
      'fields': (fields ?? []).toParamStr(),
      'limit': limit.toString(),
      'nsfw': nsfw.toString(),
      'offset': offset.toString(),
    };
    if (status != null) {
      params['status'] = status;
    }
    if (sort != null) {
      params['sort'] = sort;
    }

    return (await _getIterable<Map<String, dynamic>>(
      '/users/$username${path}list', params
    )).map((data) => mediaFactory.fromJsonMap(data['node'])).toList();
  }

  Future<Iterable<T>> _getIterable<T>(
    String path, Map<String, String> params
  ) async {
    final decoded = await _getDecoded<Map<String, dynamic>>(path, params);
    final Iterable<dynamic> datas = decoded['data'];

    return datas.cast<T>();
  }

  Future<T> _getDecoded<T>(String path, Map<String, String> params) async
    => jsonDecode(await _get(path, params));

  Future<String> _get(String path, Map<String, String> params) async
    => _req(path, params, (url) => _client.get(url));

  Future<String> _req(
    String path,
    Map<String, String> params,
    Future<http.Response> Function(Uri) req
  ) async {
    final url = Uri.https(_authority, '/$_version$path', params);
    final res = await req(url);
    if (res.statusCode != 200) {
      throw ClientException(url, res.statusCode);
    }
    return res.body;
  }

  Future<T> _patchDecoded<T>(String path, Map<String, String> body) async
    => jsonDecode(await _patch(path, body));

  Future<String> _patch(String path, Map<String, String> body) async
    => _req(path, {}, (url) => _client.patch(url, body: body));
}
