import 'package:mal_api_plus/src/utils/exts/date_time_exts.dart';
import 'package:mal_api_plus/src/utils/exts/map_exts.dart';
import 'package:mal_api_plus/src/utils/exts/nullable_exts.dart';

/// Fields shared by a user's anime and manga list entries.
abstract class UserMediaListStatus {
  /// The user's comments on the entry.
  final String? comments;

  /// When the user finished the entry.
  final DateTime? finishDate;

  /// Priority from 0 (low) to 2 (high).
  final int? priority;

  /// The user's score from 1 to 10, or 0 when not scored.
  final int? score;

  /// When the user started the entry.
  final DateTime? startDate;

  /// Tags the user added to the entry.
  final List<String>? tags;

  /// When the user last changed the entry.
  final DateTime? updatedAt;

  /// Creates a list entry from already known values.
  UserMediaListStatus(
      {this.comments,
      this.finishDate,
      this.priority,
      this.score,
      this.startDate,
      this.tags,
      this.updatedAt});

  /// Creates a list entry from a MyAnimeList API JSON object.
  UserMediaListStatus.fromJsonMap(Map<String, dynamic> data)
      : comments = data.getAs<String>('comments'),
        finishDate = data.getAs<String>('finish_date').map(DateTime.parse),
        priority = data.getAs<int>('priority'),
        score = data.getAs<int>('score'),
        startDate = data.getAs<String>('start_date').map(DateTime.parse),
        tags = data.getAs<List<dynamic>>('tags')?.cast<String>(),
        updatedAt = data.getAs<String>('updated_at').map(DateTime.parse);

  /// Converts the entry to the form fields the list update endpoints expect.
  ///
  /// A `null` field is sent as an empty string.
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
