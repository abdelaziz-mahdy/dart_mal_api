import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/exts/map_exts.dart';
import 'package:mal_api/src/utils/exts/nullable_exts.dart';

class Anime extends Media {
  final int? averageEpisodeDuration; // In seconds
  final Broadcast? broadcast;
  final AnimeMediaType? mediaType;
  final UserAnimeListStatus? myListStatus;
  final int? numEpisodes;
  final Rating? rating;
  final List<AnimeRecommendation>? recommendations;
  final Source? source;
  final SeasonYear? startSeason;
  final Statistics? statistics;
  final AiringStatus? status;
  final List<Studio>? studios;

  Anime({
    AlternativeTitles? alternativeTitles,
    this.averageEpisodeDuration,
    String? background,
    this.broadcast,
    DateTime? createdAt,
    DateTime? endDate,
    List<Genre>? genres,
    int? id,
    Picture? mainPicture,
    double? mean,
    this.mediaType,
    this.myListStatus,
    Nsfw? nsfw,
    this.numEpisodes,
    int? numFavorites,
    int? numListUsers,
    int? numScoringUsers,
    List<Picture>? pictures,
    int? popularity,
    this.rating,
    int? rank,
    this.recommendations,
    List<RelatedAnime>? relatedAnime,
    List<RelatedManga>? relatedManga,
    this.source,
    DateTime? startDate,
    this.startSeason,
    this.statistics,
    this.status,
    this.studios,
    String? synopsis,
    String? title,
    DateTime? updatedAt
  }) : super(
    alternativeTitles: alternativeTitles,
    background: background,
    createdAt: createdAt,
    endDate: endDate,
    genres: genres,
    id: id,
    mainPicture: mainPicture,
    mean: mean,
    nsfw: nsfw,
    numFavorites: numFavorites,
    numListUsers: numListUsers,
    numScoringUsers: numScoringUsers,
    pictures: pictures,
    popularity: popularity,
    rank: rank,
    relatedAnime: relatedAnime,
    relatedManga: relatedManga,
    startDate: startDate,
    synopsis: synopsis,
    title: title,
    updatedAt: updatedAt
  );

  Anime.fromJsonMap(Map<String, dynamic> data)
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
    super.fromJsonMap(data);

  static int? _getAverageEpisodeDuration(Map<String, dynamic> data) => data
    .getAs<int>('average_episode_duration');

  static Broadcast? _getBroadcast(Map<String, dynamic> data) => data
    .getAs<Map<String, dynamic>>('broadcast')
    .map(Broadcast.fromJsonMap);

  static AnimeMediaType? _getMediaType(Map<String, dynamic> data) => data
    .getAs<String>('media_type')
    .flatMap(AnimeMediaTypeUtils.tryParse);

  static UserAnimeListStatus? _getMyListStatus(Map<String, dynamic> data)
    => data
      .getAs<Map<String, dynamic>>('my_list_status')
      .map(UserAnimeListStatus.fromJsonMap);

  static int? _getNumEpisodes(Map<String, dynamic> data) => data
    .getAs<int>('num_episodes');

  static Rating? _getRating(Map<String, dynamic> data) => data
    .getAs<String>('rating')
    .flatMap(RatingUtils.tryParse);

  static List<AnimeRecommendation>? _getRecommendations(
    Map<String, dynamic> data
  ) => data
    .getAs<List<dynamic>>('recommendations')
    ?.cast<Map<String, dynamic>>()
    .map(AnimeRecommendation.fromJsonMap)
    .toList();

  static Source? _getSource(Map<String, dynamic> data) => data
    .getAs<String>('source')
    .flatMap(SourceUtils.tryParse);

  static SeasonYear? _getStartSeason(Map<String, dynamic> data) => data
    .getAs<Map<String, dynamic>>('start_season')
    .map(SeasonYear.fromJsonMap);

  static Statistics? _getStatistics(Map<String, dynamic> data) => data
    .getAs<Map<String, dynamic>>('statistics')
    .map(Statistics.fromJsonMap);

  static AiringStatus? _getStatus(Map<String, dynamic> data) => data
    .getAs<String>('status')
    .flatMap(AiringStatusUtils.tryParse);

  static List<Studio>? _getStudios(Map<String, dynamic> data) => data
    .getAs<List<dynamic>>('studios')
    ?.cast<Map<String, dynamic>>()
    .map(Studio.fromJsonMap)
    .toList();
}
