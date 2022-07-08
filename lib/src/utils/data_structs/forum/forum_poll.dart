import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/exts/map_exts.dart';

class ForumPoll {
  final bool? closed;
  final int? id;
  final List<ForumPollOption>? options;
  final String? question;

  ForumPoll.fromJsonMap(Map<String, dynamic> data)
    : closed = data.getAs<bool>('closed'),
      id = data.getAs<int>('id'),
      options
        = data
          .getAs<List<dynamic>>('options')
          ?.cast<Map<String, dynamic>>()
          .map(ForumPollOption.fromJsonMap)
          .toList(),
      question = data.getAs<String>('question');
}
