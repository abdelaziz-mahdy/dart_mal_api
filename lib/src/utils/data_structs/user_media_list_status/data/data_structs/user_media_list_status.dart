import 'package:mal_api/src/utils/exts/date_time_exts.dart';
import 'package:mal_api/src/utils/exts/map_exts.dart';
import 'package:mal_api/src/utils/exts/nullable_exts.dart';

abstract class UserMediaListStatus {
  final String? comments;
  final DateTime? finishDate;
  final int? priority;
  final int? score;
  final DateTime? startDate;
  final List<String>? tags;
  final DateTime? updatedAt;

  UserMediaListStatus({
    this.comments,
    this.finishDate,
    this.priority,
    this.score,
    this.startDate,
    this.tags,
    this.updatedAt
  });

  UserMediaListStatus.fromJsonMap(Map<String, dynamic> data)
    : comments = data.getAs<String>('comments'),
    finishDate = data.getAs<String>('finish_date').map(DateTime.parse),
    priority = data.getAs<int>('priority'),
    score = data.getAs<int>('score'),
    startDate = data.getAs<String>('start_date').map(DateTime.parse),
    tags = data.getAs<List<dynamic>>('tags')?.cast<String>(),
    updatedAt = data.getAs<String>('updated_at').map(DateTime.parse);

  Map<String, String> toStrMap() {
    final map = <String, String>{};
    map['comments'] = comments == null ? '' : comments!;
    map['finish_date'] = finishDate == null ? '' : finishDate!.toDateStr();
    map['priority'] = priority == null ? '' : priority.toString();
    map['score'] = score == null ? '' : score.toString();
    map['start_date'] = startDate == null ? '' : startDate!.toDateStr();
    map['tags'] = tags == null ? '' : tags!.join(',');
    return map;
  }
}
