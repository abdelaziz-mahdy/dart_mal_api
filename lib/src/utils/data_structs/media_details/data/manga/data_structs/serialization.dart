import 'package:mal_api_plus/mal_api_plus.dart';
import 'package:mal_api_plus/src/utils/exts/map_exts.dart';
import 'package:mal_api_plus/src/utils/exts/nullable_exts.dart';

class Serialization {
  final SerializationNode? node;
  final String? role;

  Serialization.fromJsonMap(Map<String, dynamic> data)
    : node
      = data
        .getAs<Map<String, dynamic>>('node')
        .map(SerializationNode.fromJsonMap),
    role = data.getAs<String>('role');
}
