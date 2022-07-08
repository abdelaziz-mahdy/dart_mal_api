import 'package:mal_api/src/utils/exts/map_exts.dart';
import 'package:mal_api/src/utils/exts/nullable_exts.dart';

class ForumPoster{
  final int? id;
  final Uri? forumAvator;
  final String? name;

  ForumPoster.fromJsonMap(Map<String, dynamic> data)
    : id = data.getAs<int>('id'),
      forumAvator = data.getAs<String>('forum_avator').map(Uri.parse),
      name = data.getAs<String>('name');
}
