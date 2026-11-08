import 'package:mal_api_plus/mal_api_plus.dart';
import 'package:mal_api_plus/src/utils/exts/map_exts.dart';
import 'package:mal_api_plus/src/utils/exts/nullable_exts.dart';

/// Fields shared by [Anime] and [Manga] entries.
///
/// Most fields are only set when requested through the `fields` parameter
/// of the [Client] method that returned the entry, so check for `null`.
abstract class Media {
  /// Titles in other languages, plus synonyms.
  final AlternativeTitles? alternativeTitles;

  /// Background information about the entry, as written on MyAnimeList.
  final String? background;

  /// When the entry was added to MyAnimeList.
  final DateTime? createdAt;

  /// When the anime finished airing or the manga finished publishing.
  final DateTime? endDate;

  /// Genres the entry is tagged with.
  final List<Genre>? genres;

  /// MyAnimeList ID of the entry.
  final int? id;

  /// Cover image.
  final Picture? mainPicture;

  /// Mean score given by users, from 0 to 10.
  final double? mean;

  /// How safe the entry is for work.
  final Nsfw? nsfw;

  /// Number of users who added the entry to their favorites.
  final int? numFavorites;

  /// Number of users who have the entry in their list.
  final int? numListUsers;

  /// Number of users who gave the entry a score.
  final int? numScoringUsers;

  /// Additional images of the entry.
  final List<Picture>? pictures;

  /// Popularity rank, where 1 is the entry in the most user lists.
  final int? popularity;

  /// Rank by mean score, where 1 is the highest scored entry.
  final int? rank;

  /// Anime related to this entry, such as sequels and adaptations.
  final List<RelatedAnime>? relatedAnime;

  /// Manga related to this entry, such as the source material.
  final List<RelatedManga>? relatedManga;

  /// When the anime started airing or the manga started publishing.
  final DateTime? startDate;

  /// Plot summary.
  final String? synopsis;

  /// Main title, usually romanized.
  final String? title;

  /// When the entry was last edited on MyAnimeList.
  final DateTime? updatedAt;

  /// Creates an entry from already known values.
  Media({
    this.alternativeTitles,
    this.background,
    this.createdAt,
    this.endDate,
    this.genres,
    this.id,
    this.mainPicture,
    this.mean,
    this.nsfw,
    this.numFavorites,
    this.numListUsers,
    this.numScoringUsers,
    this.pictures,
    this.popularity,
    this.rank,
    this.relatedAnime,
    this.relatedManga,
    this.startDate,
    this.synopsis,
    this.title,
    this.updatedAt,
  });

  /// Creates an entry from a MyAnimeList API JSON object.
  Media.fromJsonMap(Map<String, dynamic> data)
      : alternativeTitles = _getAlternativeTitles(data),
        background = _getBackground(data),
        createdAt = _getCreatedAt(data),
        endDate = _getEndDate(data),
        genres = _getGenres(data),
        id = _getId(data),
        mainPicture = _getMainPicture(data),
        mean = _getMean(data),
        nsfw = _getNsfw(data),
        numFavorites = _getNumFavorites(data),
        numListUsers = _getNumListUsers(data),
        numScoringUsers = _getNumScoringUsers(data),
        pictures = _getPictures(data),
        popularity = _getPopularity(data),
        rank = _getRank(data),
        relatedAnime = _getRelatedAnime(data),
        relatedManga = _getRelatedManga(data),
        startDate = _getStartDate(data),
        synopsis = _getSynopsis(data),
        title = _getTitle(data),
        updatedAt = _getUpdatedAt(data);

  static AlternativeTitles? _getAlternativeTitles(Map<String, dynamic> data) =>
      data
          .getAs<Map<String, dynamic>>('alternative_titles')
          .map(AlternativeTitles.fromJsonMap);

  static String? _getBackground(Map<String, dynamic> data) =>
      data.getAs<String>('background');

  static DateTime? _getCreatedAt(Map<String, dynamic> data) =>
      data.getAs<String>('created_at').map(DateTime.parse);

  static DateTime? _getEndDate(Map<String, dynamic> data) =>
      data.getAs<String>('end_date').map(DateTime.parse);

  static List<Genre>? _getGenres(Map<String, dynamic> data) => data
      .getAs<List<dynamic>>('genres')
      ?.cast<Map<String, dynamic>>()
      .map(Genre.fromJsonMap)
      .toList();

  static int? _getId(Map<String, dynamic> data) => data.getAs<int>('id');

  static Picture? _getMainPicture(Map<String, dynamic> data) =>
      data.getAs<Map<String, dynamic>>('main_picture').map(Picture.fromJsonMap);

  static double? _getMean(Map<String, dynamic> data) =>
      data.getAs<double>('mean');

  static Nsfw? _getNsfw(Map<String, dynamic> data) =>
      data.getAs<String>('nsfw').flatMap(NsfwUtils.tryParse);

  static int? _getNumFavorites(Map<String, dynamic> data) =>
      data.getAs<int>('num_favorites');

  static int? _getNumListUsers(Map<String, dynamic> data) =>
      data.getAs<int>('num_list_users');

  static int? _getNumScoringUsers(Map<String, dynamic> data) =>
      data.getAs<int>('num_scoring_users');

  static List<Picture>? _getPictures(Map<String, dynamic> data) => data
      .getAs<List<dynamic>>('pictures')
      ?.cast<Map<String, dynamic>>()
      .map(Picture.fromJsonMap)
      .toList();

  static int? _getPopularity(Map<String, dynamic> data) =>
      data.getAs<int>('popularity');

  static int? _getRank(Map<String, dynamic> data) => data.getAs<int>('rank');

  static List<RelatedAnime>? _getRelatedAnime(Map<String, dynamic> data) => data
      .getAs<List<dynamic>>('related_anime')
      ?.cast<Map<String, dynamic>>()
      .map(RelatedAnime.fromJsonMap)
      .toList();

  static List<RelatedManga>? _getRelatedManga(Map<String, dynamic> data) => data
      .getAs<List<dynamic>>('related_manga')
      ?.cast<Map<String, dynamic>>()
      .map(RelatedManga.fromJsonMap)
      .toList();

  static DateTime? _getStartDate(Map<String, dynamic> data) =>
      data.getAs<String>('start_date').flatMap(DateTime.tryParse);

  static String? _getSynopsis(Map<String, dynamic> data) =>
      data.getAs<String>('synopsis');

  static String? _getTitle(Map<String, dynamic> data) =>
      data.getAs<String>('title');

  static DateTime? _getUpdatedAt(Map<String, dynamic> data) =>
      data.getAs<String>('updated_at').flatMap(DateTime.tryParse);
}
