import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/exts/map_exts.dart';
import 'package:mal_api/src/utils/exts/nullable_exts.dart';

class Statistics {
  final int? numListUsers;
  final StatisticsStatus? status;

  Statistics.fromJsonMap(Map<String, dynamic> data)
    : numListUsers = data.getAs<int>('num_list_users'),
    status
      = data
        .getAs<Map<String, dynamic>>('status')
        .map(StatisticsStatus.fromJsonMap);
}
