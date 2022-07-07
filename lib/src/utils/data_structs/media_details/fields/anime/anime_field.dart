import 'package:mal_api/mal_api.dart';

class AnimeField extends MediaField {
  AnimeField.alternativeTitles([List<AlternativeTitlesField>? fields])
    : super.alternativeTitles(fields);
  AnimeField.averageEpisodeDuration() : super('average_episode_duration');
  /// Not supported when the return type is a list of [Anime].
  AnimeField.background() : super.background();
  AnimeField.broadcast([List<BroadcastField>? fields])
    : super('broadcast', fields);
  AnimeField.createdAt() : super.createdAt();
  AnimeField.endDate() : super.endDate();
  AnimeField.genres([List<GenreField>? fields]) : super.genres(fields);
  AnimeField.id() : super.id();
  AnimeField.mainPicture([List<PictureField>? fields])
    : super.mainPicture(fields);
  AnimeField.mean() : super.mean();
  AnimeField.mediaType() : super('media_type');
  AnimeField.myListStatus([List<UserAnimeListStatusField>? fields])
    : super('my_list_status', fields);
  AnimeField.nsfw() : super.nsfw();
  AnimeField.numEpisodes() : super('num_episodes');
  AnimeField.numFavorites() : super.numFavorites();
  AnimeField.numListUsers() : super.numListUsers();
  AnimeField.numScoringUsers() : super.numScoringUsers();
  /// Not supported when the return type is a list of [Anime].
  AnimeField.pictures([List<PictureField>? fields]) : super.pictures(fields);
  AnimeField.popularity() : super.popularity();
  AnimeField.rating() : super('rating');
  AnimeField.rank() : super.rank();
  /// Not supported when the return type is a list of [Anime].
  AnimeField.recommendations([List<AnimeRecommendationField>? fields])
    : super('recommendations', fields);
  /// Not supported when the return type is a list of [Anime].
  AnimeField.relatedAnime([List<RelatedAnimeField>? fields])
    : super.relatedAnime(fields);
  /// Not supported when the return type is a list of [Anime].
  AnimeField.relatedManga([List<RelatedMangaField>? fields])
    : super.relatedManga(fields);
  AnimeField.source() : super('source');
  AnimeField.startDate() : super.startDate();
  AnimeField.startSeason([List<StartSeasonField>? fields])
    : super('start_season', fields);
  /// Not supported when the return type is a list of [Anime].
  AnimeField.statistics([List<StatisticsField>? fields])
    : super('statistics', fields);
  AnimeField.status() : super.status();
  AnimeField.studios([List<StudioField>? fields]) : super('studios', fields);
  AnimeField.synopsis() : super.synopsis();
  AnimeField.title() : super.title();
  AnimeField.updatedAt() : super.updatedAt();
}
