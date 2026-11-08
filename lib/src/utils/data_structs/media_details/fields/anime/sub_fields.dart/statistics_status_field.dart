import 'package:mal_api_plus/mal_api_plus.dart';

class StatisticsStatusField extends Field {
  StatisticsStatusField.completed() : super('completed');
  StatisticsStatusField.dropped() : super('dropped');
  StatisticsStatusField.onHold() : super('on_hold');
  StatisticsStatusField.planToWatch() : super('plan_to_watch');
  StatisticsStatusField.watching() : super('watching');
}
