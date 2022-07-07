import 'package:mal_api/mal_api.dart';

class MangaField extends MediaField {
  MangaField.alternativeTitles([List<AlternativeTitlesField>? fields])
    : super.alternativeTitles(fields);
  MangaField.authors([List<AuthorField>? fields]) : super('authors', fields);
  /// Not supported when the return type is a list of [Manga].
  MangaField.background() : super.background();
  MangaField.createdAt() : super.createdAt();
  MangaField.endDate() : super.endDate();
  MangaField.genres([List<GenreField>? fields]) : super.genres(fields);
  MangaField.id() : super.id();
  MangaField.mainPicture([List<PictureField>? fields])
    : super.mainPicture(fields);
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
  MangaField.pictures([List<PictureField>? fields]) : super.pictures(fields);
  MangaField.popularity() : super.popularity();
  MangaField.rank() : super.rank();
  /// Not supported when the return type is a list of [Manga].
  MangaField.recommendations([List<MangaRecommendationField>? fields])
    : super('recommendations', fields);
  /// Not supported when the return type is a list of [Manga].
  MangaField.relatedAnime([List<RelatedAnimeField>? fields])
    : super.relatedAnime(fields);
  /// Not supported when the return type is a list of [Manga].
  MangaField.relatedManga([List<RelatedMangaField>? fields])
    : super.relatedManga(fields);
  /// Not supported when the return type is a list of [Manga].
  MangaField.serialization([List<SerializationField>? fields])
    : super('serialization', fields);
  MangaField.startDate() : super.startDate();
  MangaField.status() : super.status();
  MangaField.synopsis() : super.synopsis();
  MangaField.title() : super.title();
  MangaField.updatedAt() : super.updatedAt();
}
