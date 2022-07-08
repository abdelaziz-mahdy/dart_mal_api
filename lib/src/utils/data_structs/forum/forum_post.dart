import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/exts/map_exts.dart';
import 'package:mal_api/src/utils/exts/nullable_exts.dart';

class ForumPost {
  final String? body;
  final DateTime? createdAt;
  final ForumPoster? createdBy;
  final int? id;
  final int? number;
  final String? signature;

  ForumPost.fromJsonMap(Map<String, dynamic> data)
    : body = data.getAs<String>('body'),
      createdAt = data.getAs<String>('created_at').map(DateTime.parse),
      createdBy
        = data
          .getAs<Map<String, dynamic>>('created_by')
          .map(ForumPoster.fromJsonMap),
      id = data.getAs<int>('id'),
      number = data.getAs<int>('number'),
      signature = data.getAs<String>('signature');
}
