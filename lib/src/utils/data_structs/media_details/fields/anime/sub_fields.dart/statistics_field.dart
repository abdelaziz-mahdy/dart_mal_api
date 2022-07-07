import 'package:mal_api/mal_api.dart';

class StatisticsField extends Field {
  StatisticsField.numListUsers() : super('num_list_users');
  StatisticsField.status([List<StatisticsStatusField>? fields])
    : super('status', fields);
}
