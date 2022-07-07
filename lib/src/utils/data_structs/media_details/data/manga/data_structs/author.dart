import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/exts/map_exts.dart';
import 'package:mal_api/src/utils/exts/nullable_exts.dart';

class Author {
  final AuthorNode? node;
  final String? role;

  Author.fromJsonMap(Map<String, dynamic> data)
    : node
      = data.getAs<Map<String, dynamic>>('node').map(AuthorNode.fromJsonMap),
    role = data.getAs<String>('role');
}
