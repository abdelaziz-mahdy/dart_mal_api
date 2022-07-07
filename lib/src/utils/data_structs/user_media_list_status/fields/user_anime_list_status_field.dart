import 'package:mal_api/mal_api.dart';

class UserAnimeListStatusField extends Field {
  UserAnimeListStatusField.comments() : super('comments');
  UserAnimeListStatusField.isRewatching() : super('is_rewatching');
  UserAnimeListStatusField.finishDate() : super('finish_date');
  UserAnimeListStatusField.numEpisodesWatched() : super('num_episodes_watched');
  UserAnimeListStatusField.numTimesRewatched() : super('num_times_rewatched');
  UserAnimeListStatusField.priority() : super('priority');
  UserAnimeListStatusField.rewatchValue() : super('rewatch_value');
  UserAnimeListStatusField.score() : super('score');
  UserAnimeListStatusField.startDate() : super('start_date');
  UserAnimeListStatusField.status() : super('status');
  UserAnimeListStatusField.tags() : super('tags');
  UserAnimeListStatusField.updatedAt() : super('updated_at');
}
