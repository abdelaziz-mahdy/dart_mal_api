import 'package:mal_api/src/utils/exts/map_exts.dart';

class Ranking {
  final int? rank;
  final int? previousRank;

  Ranking.fromJsonMap(Map<String, dynamic> data)
    : rank = data.getAs<int>('rank'),
    previousRank = data.getAs<int>('previous_rank');
}
