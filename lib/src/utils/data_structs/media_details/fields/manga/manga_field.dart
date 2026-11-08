import 'package:mal_api_plus/mal_api_plus.dart';

class MangaField extends MediaField {
  MangaField.alternativeTitles([super.fields]) : super.alternativeTitles();
  MangaField.authors([List<AuthorField>? fields]) : super('authors', fields);

  /// Not supported when the return type is a list of [Manga].
  MangaField.background() : super.background();
  MangaField.createdAt() : super.createdAt();
  MangaField.endDate() : super.endDate();
  MangaField.genres([super.fields]) : super.genres();
  MangaField.id() : super.id();
  MangaField.mainPicture([super.fields]) : super.mainPicture();
  MangaField.mean() : super.mean();
  MangaField.mediaType() : super('media_type');
  MangaField.myListStatus([List<UserMangaListStatusField>? fields])
      : super('my_list_status', fields);
  MangaField.nsfw() : super.nsfw();
  MangaField.numChapters() : super('num_chapters');
  MangaField.numFavorites() : super.numFavorites();
  MangaField.numListUsers() : super.numListUsers();
  MangaField.numScoringUsers() : super.numScoringUsers();
  MangaField.numVolumes() : super('num_volumes');

  /// Not supported when the return type is a list of [Manga].
  MangaField.pictures([super.fields]) : super.pictures();
  MangaField.popularity() : super.popularity();
  MangaField.rank() : super.rank();

  /// Not supported when the return type is a list of [Manga].
  MangaField.recommendations([List<MangaRecommendationField>? fields])
      : super('recommendations', fields);

  /// Not supported when the return type is a list of [Manga].
  MangaField.relatedAnime([super.fields]) : super.relatedAnime();

  /// Not supported when the return type is a list of [Manga].
  MangaField.relatedManga([super.fields]) : super.relatedManga();

  /// Not supported when the return type is a list of [Manga].
  MangaField.serialization([List<SerializationField>? fields])
      : super('serialization', fields);
  MangaField.startDate() : super.startDate();
  MangaField.status() : super.status();
  MangaField.synopsis() : super.synopsis();
  MangaField.title() : super.title();
  MangaField.updatedAt() : super.updatedAt();
}
