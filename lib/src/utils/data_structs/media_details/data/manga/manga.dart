import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/exts/map_exts.dart';
import 'package:mal_api/src/utils/exts/nullable_exts.dart';

class Manga extends Media {
  final List<Author>? authors;
  final MangaMediaType? mediaType;
  final UserMangaListStatus? myListStatus;
  final int? numChapters;
  final int? numVolumes;
  final List<MangaRecommendation>? recommendations;
  final List<Serialization>? serialization;
  final PublishingStatus? status;

  Manga({
    AlternativeTitles? alternativeTitles,
    this.authors,
    String? background,
    DateTime? createdAt,
    DateTime? endDate,
    List<Genre>? genres,
    int? id,
    Picture? mainPicture,
    double? mean,
    this.mediaType,
    this.myListStatus,
    Nsfw? nsfw,
    this.numChapters,
    int? numFavorites,
    int? numListUsers,
    int? numScoringUsers,
    this.numVolumes,
    List<Picture>? pictures,
    int? popularity,
    int? rank,
    this.recommendations,
    List<RelatedAnime>? relatedAnime,
    List<RelatedManga>? relatedManga,
    this.serialization,
    DateTime? startDate,
    this.status,
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

  Manga.fromJsonMap(Map<String, dynamic> data)
    : authors = _getAuthors(data),
    mediaType = _getMediaType(data),
    myListStatus = _getMyListStatus(data),
    numChapters = _getNumChapters(data),
    numVolumes = _getNumVolumes(data),
    recommendations = _getRecommendations(data),
    serialization = _getSerialization(data),
    status = _getStatus(data),
    super.fromJsonMap(data);

  static List<Author>? _getAuthors(Map<String, dynamic> data) => data
    .getAs<List<dynamic>>('authors')
    ?.cast<Map<String, dynamic>>()
    .map(Author.fromJsonMap)
    .toList();

  static MangaMediaType? _getMediaType(Map<String, dynamic> data) => data
    .getAs<String>('media_type')
    .flatMap(MangaMediaTypeUtils.tryParse);

  static UserMangaListStatus? _getMyListStatus(Map<String, dynamic> data)
    => data
      .getAs<Map<String, dynamic>>('my_list_status')
      .map(UserMangaListStatus.fromJsonMap);

  static int? _getNumChapters(Map<String, dynamic> data) => data
    .getAs<int>('num_chapters');

  static int? _getNumVolumes(Map<String, dynamic> data) => data
    .getAs<int>('num_volumes');

  static List<MangaRecommendation>? _getRecommendations(
    Map<String, dynamic> data
  ) => data
    .getAs<List<dynamic>>('recommendations')
    ?.cast<Map<String, dynamic>>()
    .map(MangaRecommendation.fromJsonMap)
    .toList();

  static List<Serialization>? _getSerialization(Map<String, dynamic> data)
    => data
      .getAs<List<dynamic>>('serialization')
      ?.cast<Map<String, dynamic>>()
      .map(Serialization.fromJsonMap)
      .toList();

  static PublishingStatus? _getStatus(Map<String, dynamic> data) => data
    .getAs<String>('status')
    .flatMap(PublishingStatusUtils.tryParse);
}
