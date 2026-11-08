import 'package:mal_api_plus/mal_api_plus.dart';
import 'package:mal_api_plus/src/utils/exts/map_exts.dart';
import 'package:mal_api_plus/src/utils/exts/nullable_exts.dart';

/// A manga entry from MyAnimeList.
class Manga extends Media {
  /// Authors and their roles, such as story or art.
  final List<Author>? authors;

  /// Format, such as manga, novel or one-shot.
  final MangaMediaType? mediaType;

  /// The signed-in user's list entry for this manga, if any.
  final UserMangaListStatus? myListStatus;

  /// Total number of chapters, or 0 when unknown.
  final int? numChapters;

  /// Total number of volumes, or 0 when unknown.
  final int? numVolumes;

  /// Manga that users recommend to fans of this one.
  final List<MangaRecommendation>? recommendations;

  /// Magazines the manga was serialized in.
  final List<Serialization>? serialization;

  /// Whether the manga is finished, publishing, or not yet published.
  final PublishingStatus? status;

  /// Creates a manga from already known values.
  Manga(
      {super.alternativeTitles,
      this.authors,
      super.background,
      super.createdAt,
      super.endDate,
      super.genres,
      super.id,
      super.mainPicture,
      super.mean,
      this.mediaType,
      this.myListStatus,
      super.nsfw,
      this.numChapters,
      super.numFavorites,
      super.numListUsers,
      super.numScoringUsers,
      this.numVolumes,
      super.pictures,
      super.popularity,
      super.rank,
      this.recommendations,
      super.relatedAnime,
      super.relatedManga,
      this.serialization,
      super.startDate,
      this.status,
      super.synopsis,
      super.title,
      super.updatedAt});

  /// Creates a manga from a MyAnimeList API JSON object.
  Manga.fromJsonMap(super.data)
      : authors = _getAuthors(data),
        mediaType = _getMediaType(data),
        myListStatus = _getMyListStatus(data),
        numChapters = _getNumChapters(data),
        numVolumes = _getNumVolumes(data),
        recommendations = _getRecommendations(data),
        serialization = _getSerialization(data),
        status = _getStatus(data),
        super.fromJsonMap();

  static List<Author>? _getAuthors(Map<String, dynamic> data) => data
      .getAs<List<dynamic>>('authors')
      ?.cast<Map<String, dynamic>>()
      .map(Author.fromJsonMap)
      .toList();

  static MangaMediaType? _getMediaType(Map<String, dynamic> data) =>
      data.getAs<String>('media_type').flatMap(MangaMediaTypeUtils.tryParse);

  static UserMangaListStatus? _getMyListStatus(Map<String, dynamic> data) =>
      data
          .getAs<Map<String, dynamic>>('my_list_status')
          .map(UserMangaListStatus.fromJsonMap);

  static int? _getNumChapters(Map<String, dynamic> data) =>
      data.getAs<int>('num_chapters');

  static int? _getNumVolumes(Map<String, dynamic> data) =>
      data.getAs<int>('num_volumes');

  static List<MangaRecommendation>? _getRecommendations(
          Map<String, dynamic> data) =>
      data
          .getAs<List<dynamic>>('recommendations')
          ?.cast<Map<String, dynamic>>()
          .map(MangaRecommendation.fromJsonMap)
          .toList();

  static List<Serialization>? _getSerialization(Map<String, dynamic> data) =>
      data
          .getAs<List<dynamic>>('serialization')
          ?.cast<Map<String, dynamic>>()
          .map(Serialization.fromJsonMap)
          .toList();

  static PublishingStatus? _getStatus(Map<String, dynamic> data) =>
      data.getAs<String>('status').flatMap(PublishingStatusUtils.tryParse);
}
