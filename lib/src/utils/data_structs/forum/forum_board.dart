import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/exts/map_exts.dart';

class ForumBoard {
  final String? description;
  final int? id;
  final String? title;
  final List<ForumSubboard>? subboards;

  ForumBoard.fromJsonMap(Map<String, dynamic> data)
    : description = data.getAs<String>('description'),
      id = data.getAs<int>('id'),
      title = data.getAs<String>('title'),
      subboards
        = data
          .getAs<List<dynamic>>('subboards')
          ?.cast<Map<String, dynamic>>()
          .map(ForumSubboard.fromJsonMap).toList();
}
