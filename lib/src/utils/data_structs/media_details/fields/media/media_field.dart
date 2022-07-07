import 'package:mal_api/mal_api.dart';

class MediaField extends Field {
  MediaField(String name, [List<Field>? fields]) : super(name, fields);

  MediaField.alternativeTitles([List<AlternativeTitlesField>? fields])
    : super('alternative_titles', fields);
  MediaField.background() : super('background');
  MediaField.createdAt() : super('created_at');
  MediaField.endDate() : super('end_date');
  MediaField.genres([List<GenreField>? fields]) : super('genres', fields);
  MediaField.id() : super('id');
  MediaField.mainPicture([List<PictureField>? fields])
    : super('main_picture', fields);
  MediaField.mean() : super('mean');
  MediaField.nsfw() : super('nsfw');
  MediaField.numFavorites() : super('num_favorites');
  MediaField.numListUsers() : super('num_list_users');
  MediaField.numScoringUsers() : super('num_scoring_users');
  MediaField.pictures([List<PictureField>? fields]) : super('pictures', fields);
  MediaField.popularity() : super('popularity');
  MediaField.rank() : super('rank');
  MediaField.relatedAnime([List<RelatedAnimeField>? fields])
    : super('related_anime', fields);
  MediaField.relatedManga([List<RelatedMangaField>? fields])
    : super('related_manga', fields);
  MediaField.startDate() : super('start_date');
  MediaField.status() : super('status');
  MediaField.synopsis() : super('synopsis');
  MediaField.title() : super('title');
  MediaField.updatedAt() : super('updated_at');
}
