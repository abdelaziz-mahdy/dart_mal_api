import 'package:mal_api_plus/mal_api_plus.dart';

class StatisticsField extends Field {
  StatisticsField.numListUsers() : super('num_list_users');
  StatisticsField.status([List<StatisticsStatusField>? fields])
      : super('status', fields);
}
