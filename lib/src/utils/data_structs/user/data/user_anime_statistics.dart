import 'package:mal_api/src/utils/exts/map_exts.dart';
import 'package:mal_api/src/utils/exts/nullable_exts.dart';

class UserAnimeStatistics {
  final int? meanScore;
  final double? numDays;
  final double? numDaysCompleted;
  final double? numDaysDropped;
  final double? numDaysOnHold;
  final double? numDaysWatched;
  final double? numDaysWatching;
  final int? numEpisodes;
  final int? numItems;
  final int? numItemsCompleted;
  final int? numItemsDropped;
  final int? numItemsOnHold;
  final int? numItemsPlanToWatch;
  final int? numItemsWatching;
  final int? numTimesRewatched;

  UserAnimeStatistics.fromJsonMap(Map<String, dynamic> data)
    : meanScore = data.getAs<int>('mean_score'),
      numDays
        = data.getAs<num>('num_days').map((i) => double.parse(i.toString())),
      numDaysCompleted
        = data
          .getAs<num>('num_days_completed')
          .map((i) => double.parse(i.toString())),
      numDaysDropped
        = data
          .getAs<num>('num_days_dropped')
          .map((i) => double.parse(i.toString())),
      numDaysOnHold
        = data
          .getAs<num>('num_days_on_hold')
          .map((i) => double.parse(i.toString())),
      numDaysWatched
        = data
          .getAs<num>('num_days_watched')
          .map((i) => double.parse(i.toString())),
      numDaysWatching
        = data
          .getAs<num>('num_days_watching')
          .map((i) => double.parse(i.toString())),
      numEpisodes = data.getAs<int>('num_episodes'),
      numItems = data.getAs<int>('num_items'),
      numItemsCompleted = data.getAs<int>('num_items_completed'),
      numItemsDropped = data.getAs<int>('num_items_dropped'),
      numItemsOnHold = data.getAs<int>('num_items_on_hold'),
      numItemsPlanToWatch = data.getAs<int>('num_items_plan_to_watch'),
      numItemsWatching = data.getAs<int>('num_items_watching'),
      numTimesRewatched = data.getAs<int>('num_times_rewatched');
}
