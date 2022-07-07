import 'package:mal_api/src/utils/exts/map_exts.dart';

class Genre {
  final int? id;
  final String? name;

  Genre.fromJsonMap(Map<String, dynamic> data)
    : id = data.getAs<int>('id'), name = data.getAs<String>('name');
}
