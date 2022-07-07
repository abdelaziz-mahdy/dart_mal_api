import 'package:mal_api/mal_api.dart';

class AnimeStatisticsField extends Field {
  AnimeStatisticsField.meanScore() : super('mean_score');
  AnimeStatisticsField.numDays() : super('num_days');
  AnimeStatisticsField.numDaysCompleted() : super('num_days_completed');
  AnimeStatisticsField.numDaysDropped() : super('num_days_dropped');
  AnimeStatisticsField.numDaysOnHold() : super('num_days_on_hold');
  AnimeStatisticsField.numDaysWatched() : super('num_days_watched');
  AnimeStatisticsField.numDaysWatching() : super('num_days_watching');
  AnimeStatisticsField.numEpisodes() : super('num_episodes');
  AnimeStatisticsField.numItems() : super('num_items');
  AnimeStatisticsField.numItemsCompleted() : super('num_items_completed');
  AnimeStatisticsField.numItemsDropped() : super('num_items_dropped');
  AnimeStatisticsField.numItemsOnHold() : super('num_items_on_hold');
  AnimeStatisticsField.numItemsPlanToWatch() : super('num_items_plan_to_watch');
  AnimeStatisticsField.numItemsWatching() : super('num_items_watching');
  AnimeStatisticsField.numTimesRewatched() : super('num_times_rewatched');
}
