import 'package:mal_api/src/utils/exts/map_exts.dart';

class ForumPollOption {
  final int? id;
  final String? text;
  final int? votes;

  ForumPollOption.fromJsonMap(Map<String, dynamic> data)
    : id = data.getAs<int>('id'),
      text = data.getAs<String>('text'),
      votes = data.getAs<int>('votes');
}
