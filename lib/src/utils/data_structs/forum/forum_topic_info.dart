import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/exts/map_exts.dart';
import 'package:mal_api/src/utils/exts/nullable_exts.dart';

class ForumTopicInfo {
  final DateTime? createdAt;
  final ForumPoster? createdBy;
  final int? id;
  final bool? isLocked;
  final DateTime? lastPostCreatedAt;
  final ForumPoster? lastPostCreatedBy;
  final int? numberOfPosts;
  final String? title;

  ForumTopicInfo.fromJsonMap(Map<String, dynamic> data)
    : createdAt = data.getAs<String>('created_at').map(DateTime.parse),
      createdBy
        = data
          .getAs<Map<String, dynamic>>('created_by')
          .map(ForumPoster.fromJsonMap),
      id = data.getAs<int>('id'),
      isLocked = data.getAs<bool>('is_locked'),
      lastPostCreatedAt
        = data.getAs<String>('last_post_created_at').map(DateTime.parse),
      lastPostCreatedBy
        = data
          .getAs<Map<String, dynamic>>('last_post_created_by')
          .map(ForumPoster.fromJsonMap),
      numberOfPosts = data.getAs<int>('number_of_posts'),
      title = data.getAs<String>('title');
}
