import 'package:mal_api/src/utils/exts/map_exts.dart';

class SerializationNode {
  final int? id;
  final String? name;

  SerializationNode.fromJsonMap(Map<String, dynamic> data)
    : id = data.getAs<int>('id'), name = data.getAs<String>('name');
}
