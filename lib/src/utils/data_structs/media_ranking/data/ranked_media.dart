import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/exts/map_exts.dart';
import 'package:mal_api/src/utils/exts/nullable_exts.dart';
import 'package:mal_api/src/utils/factories/media_factories/media_factory.dart';

abstract class RankedMedia {
  final Media? mediaNode;
  final Ranking? ranking;

  RankedMedia.fromJsonMap(
    Map<String, dynamic> data, MediaFactory mediaFactory
  ) : mediaNode
      = data.getAs<Map<String, dynamic>>('node').map(mediaFactory.fromJsonMap),
    ranking
      = data.getAs<Map<String, dynamic>>('ranking').map(Ranking.fromJsonMap);
}
