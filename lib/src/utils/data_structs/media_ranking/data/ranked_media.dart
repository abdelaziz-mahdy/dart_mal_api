import 'package:mal_api_plus/mal_api_plus.dart';
import 'package:mal_api_plus/src/utils/exts/map_exts.dart';
import 'package:mal_api_plus/src/utils/exts/nullable_exts.dart';
import 'package:mal_api_plus/src/utils/factories/media_factories/media_factory.dart';

abstract class RankedMedia {
  final Media? mediaNode;
  final Ranking? ranking;

  RankedMedia.fromJsonMap(Map<String, dynamic> data, MediaFactory mediaFactory)
      : mediaNode = data
            .getAs<Map<String, dynamic>>('node')
            .map(mediaFactory.fromJsonMap),
        ranking = data
            .getAs<Map<String, dynamic>>('ranking')
            .map(Ranking.fromJsonMap);
}
