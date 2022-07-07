import 'package:mal_api/mal_api.dart';

class StatisticsStatusField extends Field {
  StatisticsStatusField.completed() : super('completed');
  StatisticsStatusField.dropped() : super('dropped');
  StatisticsStatusField.onHold() : super('on_hold');
  StatisticsStatusField.planToWatch() : super('plan_to_watch');
  StatisticsStatusField.watching() : super('watching');
}
