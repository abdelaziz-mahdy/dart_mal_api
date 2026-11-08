import 'package:mal_api_plus/src/utils/exts/map_exts.dart';

class Studio {
  final int? id;
  final String? name;

  Studio.fromJsonMap(Map<String, dynamic> data)
      : id = data.getAs<int>('id'),
        name = data.getAs<String>('name');
}
