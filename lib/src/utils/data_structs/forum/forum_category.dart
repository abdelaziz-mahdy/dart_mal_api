import 'package:mal_api_plus/mal_api_plus.dart';
import 'package:mal_api_plus/src/utils/exts/map_exts.dart';

class ForumCategory {
  final List<ForumBoard>? boards;
  final String? title;

  ForumCategory.fromJsonMap(Map<String, dynamic> data)
    : boards
        = data
          .getAs<List<dynamic>>('boards')
          ?.cast<Map<String, dynamic>>()
          .map(ForumBoard.fromJsonMap)
          .toList(),
      title = data.getAs<String>('title');
}
