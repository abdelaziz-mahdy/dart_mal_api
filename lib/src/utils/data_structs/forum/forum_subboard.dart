import 'package:mal_api/src/utils/exts/map_exts.dart';

class ForumSubboard {
  final int? id;
  final String? title;

  ForumSubboard.fromJsonMap(Map<String, dynamic> map)
    : id = map.getAs<int>('id'),
      title = map.getAs<String>('title');
}
