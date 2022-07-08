import 'package:mal_api/mal_api.dart';

class UserAnimeStatisticsField extends Field {
  UserAnimeStatisticsField.meanScore() : super('mean_score');
  UserAnimeStatisticsField.numDays() : super('num_days');
  UserAnimeStatisticsField.numDaysCompleted() : super('num_days_completed');
  UserAnimeStatisticsField.numDaysDropped() : super('num_days_dropped');
  UserAnimeStatisticsField.numDaysOnHold() : super('num_days_on_hold');
  UserAnimeStatisticsField.numDaysWatched() : super('num_days_watched');
  UserAnimeStatisticsField.numDaysWatching() : super('num_days_watching');
  UserAnimeStatisticsField.numEpisodes() : super('num_episodes');
  UserAnimeStatisticsField.numItems() : super('num_items');
  UserAnimeStatisticsField.numItemsCompleted() : super('num_items_completed');
  UserAnimeStatisticsField.numItemsDropped() : super('num_items_dropped');
  UserAnimeStatisticsField.numItemsOnHold() : super('num_items_on_hold');
  UserAnimeStatisticsField.numItemsPlanToWatch()
    : super('num_items_plan_to_watch');
  UserAnimeStatisticsField.numItemsWatching() : super('num_items_watching');
  UserAnimeStatisticsField.numTimesRewatched() : super('num_times_rewatched');
}
