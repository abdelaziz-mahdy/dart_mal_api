import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/exts/map_exts.dart';
import 'package:mal_api/src/utils/exts/nullable_exts.dart';

class ForumTopic {
  final ForumPoll? poll;
  final List<ForumPost>? posts;
  final String? title;

  ForumTopic.fromJsonMap(Map<String, dynamic> data)
    : poll
        = data
          .getAs<Map<String, dynamic>>('poll')
          .map(ForumPoll.fromJsonMap),
      posts
        = data
          .getAs<List<dynamic>>('posts')
          ?.cast<Map<String, dynamic>>()
          .map(ForumPost.fromJsonMap)
          .toList(),
        title = data.getAs<String>('title');
}
