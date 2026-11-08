import 'package:mal_api_plus/mal_api_plus.dart';
import 'package:mal_api_plus/src/utils/exts/map_exts.dart';
import 'package:mal_api_plus/src/utils/exts/nullable_exts.dart';

class UserMangaListStatus extends UserMediaListStatus {
  final bool? isRereading;
  final int? numChaptersRead;
  final int? numTimesReread;
  final int? numVolumesRead;
  final int? rereadValue;
  final ReadStatus? status;

  UserMangaListStatus({
    super.comments,
    super.finishDate,
    this.isRereading,
    this.numChaptersRead,
    this.numTimesReread,
    this.numVolumesRead,
    super.priority,
    this.rereadValue,
    super.score,
    super.startDate,
    this.status,
    super.tags,
    super.updatedAt,
  });

  UserMangaListStatus.fromJsonMap(super.data)
      : isRereading = data.getAs<bool>('is_rereading'),
        numChaptersRead = data.getAs<int>('num_chapters_read'),
        numTimesReread = data.getAs<int>('num_times_reread'),
        numVolumesRead = data.getAs<int>('num_volumes_read'),
        rereadValue = data.getAs<int>('reread_value'),
        status = data.getAs<String>('status').flatMap(ReadStatusUtils.tryParse),
        super.fromJsonMap();

  @override
  Map<String, String> toStrMap() {
    final map = super.toStrMap();
    map['is_rereading'] = isRereading == null ? '' : isRereading.toString();
    map['num_chapters_read'] =
        numChaptersRead == null ? '' : numChaptersRead.toString();
    map['num_times_reread'] =
        numTimesReread == null ? '' : numTimesReread.toString();
    map['num_volumes_read'] =
        numVolumesRead == null ? '' : numVolumesRead.toString();
    map['reread_value'] = rereadValue == null ? '' : rereadValue.toString();
    map['status'] = status == null ? '' : status!.toParamStr();
    return map;
  }
}
