import 'package:mal_api_plus/mal_api_plus.dart';
import 'package:mal_api_plus/src/utils/exts/map_exts.dart';
import 'package:mal_api_plus/src/utils/exts/nullable_exts.dart';

class Author {
  final AuthorNode? node;
  final String? role;

  Author.fromJsonMap(Map<String, dynamic> data)
    : node
      = data.getAs<Map<String, dynamic>>('node').map(AuthorNode.fromJsonMap),
    role = data.getAs<String>('role');
}
