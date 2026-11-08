import 'package:mal_api_plus/mal_api_plus.dart';
import 'package:mal_api_plus/src/utils/exts/map_exts.dart';
import 'package:mal_api_plus/src/utils/exts/nullable_exts.dart';

/// An anime entry from MyAnimeList.
class Anime extends Media {
  /// Average length of one episode, in seconds.
  final int? averageEpisodeDuration;

  /// Day and time of the weekly broadcast in Japan.
  final Broadcast? broadcast;

  /// Format, such as TV, movie or OVA.
  final AnimeMediaType? mediaType;

  /// The signed-in user's list entry for this anime, if any.
  final UserAnimeListStatus? myListStatus;

  /// Total number of episodes, or 0 when unknown.
  final int? numEpisodes;

  /// Age rating.
  final Rating? rating;

  /// Anime that users recommend to fans of this one.
  final List<AnimeRecommendation>? recommendations;

  /// Source material, such as manga or light novel.
  final Source? source;

  /// Season and year the anime started airing.
  final SeasonYear? startSeason;

  /// How many users have the anime in each list status.
  final Statistics? statistics;

  /// Whether the anime has aired, is airing, or has not aired yet.
  final AiringStatus? status;

  /// Studios that produced the anime.
  final List<Studio>? studios;

  /// Creates an anime from already known values.
  Anime(
      {super.alternativeTitles,
      this.averageEpisodeDuration,
      super.background,
      this.broadcast,
      super.createdAt,
      super.endDate,
      super.genres,
      super.id,
      super.mainPicture,
      super.mean,
      this.mediaType,
      this.myListStatus,
      super.nsfw,
      this.numEpisodes,
      super.numFavorites,
      super.numListUsers,
      super.numScoringUsers,
      super.pictures,
      super.popularity,
      this.rating,
      super.rank,
      this.recommendations,
      super.relatedAnime,
      super.relatedManga,
      this.source,
      super.startDate,
      this.startSeason,
      this.statistics,
      this.status,
      this.studios,
      super.synopsis,
      super.title,
      super.updatedAt});

  /// Creates an anime from a MyAnimeList API JSON object.
  Anime.fromJsonMap(super.data)
      : averageEpisodeDuration = _getAverageEpisodeDuration(data),
        broadcast = _getBroadcast(data),
        mediaType = _getMediaType(data),
        myListStatus = _getMyListStatus(data),
        numEpisodes = _getNumEpisodes(data),
        rating = _getRating(data),
        recommendations = _getRecommendations(data),
        source = _getSource(data),
        startSeason = _getStartSeason(data),
        statistics = _getStatistics(data),
        status = _getStatus(data),
        studios = _getStudios(data),
        super.fromJsonMap();

  static int? _getAverageEpisodeDuration(Map<String, dynamic> data) =>
      data.getAs<int>('average_episode_duration');

  static Broadcast? _getBroadcast(Map<String, dynamic> data) =>
      data.getAs<Map<String, dynamic>>('broadcast').map(Broadcast.fromJsonMap);

  static AnimeMediaType? _getMediaType(Map<String, dynamic> data) =>
      data.getAs<String>('media_type').flatMap(AnimeMediaTypeUtils.tryParse);

  static UserAnimeListStatus? _getMyListStatus(Map<String, dynamic> data) =>
      data
          .getAs<Map<String, dynamic>>('my_list_status')
          .map(UserAnimeListStatus.fromJsonMap);

  static int? _getNumEpisodes(Map<String, dynamic> data) =>
      data.getAs<int>('num_episodes');

  static Rating? _getRating(Map<String, dynamic> data) =>
      data.getAs<String>('rating').flatMap(RatingUtils.tryParse);

  static List<AnimeRecommendation>? _getRecommendations(
          Map<String, dynamic> data) =>
      data
          .getAs<List<dynamic>>('recommendations')
          ?.cast<Map<String, dynamic>>()
          .map(AnimeRecommendation.fromJsonMap)
          .toList();

  static Source? _getSource(Map<String, dynamic> data) =>
      data.getAs<String>('source').flatMap(SourceUtils.tryParse);

  static SeasonYear? _getStartSeason(Map<String, dynamic> data) => data
      .getAs<Map<String, dynamic>>('start_season')
      .map(SeasonYear.fromJsonMap);

  static Statistics? _getStatistics(Map<String, dynamic> data) => data
      .getAs<Map<String, dynamic>>('statistics')
      .map(Statistics.fromJsonMap);

  static AiringStatus? _getStatus(Map<String, dynamic> data) =>
      data.getAs<String>('status').flatMap(AiringStatusUtils.tryParse);

  static List<Studio>? _getStudios(Map<String, dynamic> data) => data
      .getAs<List<dynamic>>('studios')
      ?.cast<Map<String, dynamic>>()
      .map(Studio.fromJsonMap)
      .toList();
}
