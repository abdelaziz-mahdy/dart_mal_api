import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/exts/map_exts.dart';
import 'package:mal_api/src/utils/exts/nullable_exts.dart';

class UserAnimeListStatus extends UserMediaListStatus {
  final bool? isRewatching;
  final int? numEpisodesWatched;
  final int? numTimesRewatched;
  final int? rewatchValue;
  final WatchStatus? status;

  UserAnimeListStatus({
    String? comments,
    DateTime? finishDate,
    this.isRewatching,
    this.numEpisodesWatched,
    this.numTimesRewatched,
    int? priority,
    this.rewatchValue,
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

  UserAnimeListStatus.fromJsonMap(Map<String, dynamic> data)
    : isRewatching = data.getAs<bool>('is_rewatching'),
    numEpisodesWatched = data.getAs<int>('num_episodes_watched'),
    numTimesRewatched = data.getAs<int>('num_times_rewatched'),
    rewatchValue = data.getAs<int>('rewatch_value'),
    status = data.getAs<String>('status').flatMap(WatchStatusUtils.tryParse),
    super.fromJsonMap(data);

  @override
  Map<String, String> toStrMap() {
    final map = super.toStrMap();
    map['is_rewatching'] = isRewatching == null ? '' : isRewatching.toString();
    // num_watched_episodes is not a typo of num_episodes_watched. This is base
    // on the specifications of the MAL API
    map['num_watched_episodes']
      = numEpisodesWatched == null ? '' : numEpisodesWatched.toString();
    map['num_times_rewatched']
      = numTimesRewatched == null ? '' : numTimesRewatched.toString();
    map['rewatch_value'] = rewatchValue == null ? '' : rewatchValue.toString();
    map['status'] = status == null ? '' : status!.toParamStr();
    return map;
  }
}
