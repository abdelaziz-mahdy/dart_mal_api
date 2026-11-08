import 'package:mal_api_plus/mal_api_plus.dart';

class AnimeField extends MediaField {
  AnimeField.alternativeTitles([super.fields]) : super.alternativeTitles();
  AnimeField.averageEpisodeDuration() : super('average_episode_duration');

  /// Not supported when the return type is a list of [Anime].
  AnimeField.background() : super.background();
  AnimeField.broadcast([List<BroadcastField>? fields])
      : super('broadcast', fields);
  AnimeField.createdAt() : super.createdAt();
  AnimeField.endDate() : super.endDate();
  AnimeField.genres([super.fields]) : super.genres();
  AnimeField.id() : super.id();
  AnimeField.mainPicture([super.fields]) : super.mainPicture();
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
  AnimeField.pictures([super.fields]) : super.pictures();
  AnimeField.popularity() : super.popularity();
  AnimeField.rating() : super('rating');
  AnimeField.rank() : super.rank();

  /// Not supported when the return type is a list of [Anime].
  AnimeField.recommendations([List<AnimeRecommendationField>? fields])
      : super('recommendations', fields);

  /// Not supported when the return type is a list of [Anime].
  AnimeField.relatedAnime([super.fields]) : super.relatedAnime();

  /// Not supported when the return type is a list of [Anime].
  AnimeField.relatedManga([super.fields]) : super.relatedManga();
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
