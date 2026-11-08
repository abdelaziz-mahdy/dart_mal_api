import 'package:mal_api_plus/mal_api_plus.dart';
import 'package:mal_api_plus/src/utils/exts/map_exts.dart';
import 'package:mal_api_plus/src/utils/exts/nullable_exts.dart';

class SeasonYear {
  final int? year;
  final Season? season;

  SeasonYear.fromJsonMap(Map<String, dynamic> data)
      : year = data.getAs<int>('year'),
        season = data.getAs<String>('season').flatMap(SeasonUtils.tryParse);
}
