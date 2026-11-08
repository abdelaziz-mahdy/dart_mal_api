import 'package:mal_api_plus/mal_api_plus.dart';
import 'package:mal_api_plus/src/utils/exts/map_exts.dart';
import 'package:mal_api_plus/src/utils/exts/nullable_exts.dart';

class UserAnimeListStatus extends UserMediaListStatus {
  final bool? isRewatching;
  final int? numEpisodesWatched;
  final int? numTimesRewatched;
  final int? rewatchValue;
  final WatchStatus? status;

  UserAnimeListStatus({
    super.comments,
    super.finishDate,
    this.isRewatching,
    this.numEpisodesWatched,
    this.numTimesRewatched,
    super.priority,
    this.rewatchValue,
    super.score,
    super.startDate,
    this.status,
    super.tags,
    super.updatedAt,
  });

  UserAnimeListStatus.fromJsonMap(super.data)
      : isRewatching = data.getAs<bool>('is_rewatching'),
        numEpisodesWatched = data.getAs<int>('num_episodes_watched'),
        numTimesRewatched = data.getAs<int>('num_times_rewatched'),
        rewatchValue = data.getAs<int>('rewatch_value'),
        status =
            data.getAs<String>('status').flatMap(WatchStatusUtils.tryParse),
        super.fromJsonMap();

  @override
  Map<String, String> toStrMap() {
    final map = super.toStrMap();
    map['is_rewatching'] = isRewatching == null ? '' : isRewatching.toString();
    // num_watched_episodes is not a typo of num_episodes_watched. This is base
    // on the specifications of the MAL API
    map['num_watched_episodes'] =
        numEpisodesWatched == null ? '' : numEpisodesWatched.toString();
    map['num_times_rewatched'] =
        numTimesRewatched == null ? '' : numTimesRewatched.toString();
    map['rewatch_value'] = rewatchValue == null ? '' : rewatchValue.toString();
    map['status'] = status == null ? '' : status!.toParamStr();
    return map;
  }
}
