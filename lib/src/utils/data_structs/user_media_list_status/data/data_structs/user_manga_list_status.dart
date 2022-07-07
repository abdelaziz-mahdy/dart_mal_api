import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/exts/map_exts.dart';
import 'package:mal_api/src/utils/exts/nullable_exts.dart';

class UserMangaListStatus extends UserMediaListStatus {
  final bool? isRereading;
  final int? numChaptersRead;
  final int? numTimesReread;
  final int? numVolumesRead;
  final int? rereadValue;
  final ReadStatus? status;

  UserMangaListStatus({
    String? comments,
    DateTime? finishDate,
    this.isRereading,
    this.numChaptersRead,
    this.numTimesReread,
    this.numVolumesRead,
    int? priority,
    this.rereadValue,
    int? score,
    DateTime? startDate,
    this.status,
    List<String>? tags,
    DateTime? updatedAt,
  }) : super(
    comments: comments,
    finishDate: finishDate,
    priority: priority,
    score: score,
    startDate: startDate,
    tags: tags,
    updatedAt: updatedAt
  );

  UserMangaListStatus.fromJsonMap(Map<String, dynamic> data)
    : isRereading = data.getAs<bool>('is_rereading'),
    numChaptersRead = data.getAs<int>('num_chapters_read'),
    numTimesReread = data.getAs<int>('num_times_reread'),
    numVolumesRead = data.getAs<int>('num_volumes_read'),
    rereadValue = data.getAs<int>('reread_value'),
    status = data.getAs<String>('status').flatMap(ReadStatusUtils.tryParse),
    super.fromJsonMap(data);

  @override
  Map<String, String> toStrMap() {
    final map = super.toStrMap();
    map['is_rereading'] = isRereading == null ? '' : isRereading.toString();
    map['num_chapters_read']
      = numChaptersRead == null ? '' : numChaptersRead.toString();
    map['num_times_reread']
      = numTimesReread == null ? '' : numTimesReread.toString();
    map['num_volumes_read']
      = numVolumesRead == null ? '' : numVolumesRead.toString();
    map['reread_value'] = rereadValue == null ? '' : rereadValue.toString();
    map['status'] = status == null ? '' : status!.toParamStr();
    return map;
  }
}
