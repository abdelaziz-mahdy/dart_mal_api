import 'package:mal_api/src/utils/exts/map_exts.dart';
import 'package:mal_api/src/utils/exts/nullable_exts.dart';

class StatisticsStatus {
  final int? completed;
  final int? dropped;
  final int? onHold;
  final int? planToWatch;
  final int? watching;

  StatisticsStatus.fromJsonMap(Map<String, dynamic> data)
    : completed = data.getAs<String>('completed').flatMap(int.tryParse),
    dropped = data.getAs<String>('dropped').flatMap(int.tryParse),
    onHold = data.getAs<String>('on_hold').flatMap(int.tryParse),
    planToWatch = data.getAs<String>('plan_to_watch').flatMap(int.tryParse),
    watching = data.getAs<String>('watching').flatMap(int.tryParse);
}
