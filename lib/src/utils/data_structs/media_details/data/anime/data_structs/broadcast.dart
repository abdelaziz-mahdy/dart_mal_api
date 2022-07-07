import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/exts/map_exts.dart';
import 'package:mal_api/src/utils/exts/nullable_exts.dart';
import 'package:mal_api/src/utils/utils/date_time_utils.dart';

class Broadcast {
  final DayOfTheWeek? dayOfTheWeek;
  final DateTime? startTime; // Only properties relating to time are relavant

  Broadcast.fromJsonMap(Map<String, dynamic> data)
    : dayOfTheWeek
      = data
        .getAs<String>('day_of_the_week')
        .flatMap(DayOfTheWeekUtils.tryParse),
    startTime = data.getAs<String>('start_time').map(parseTime);
}
