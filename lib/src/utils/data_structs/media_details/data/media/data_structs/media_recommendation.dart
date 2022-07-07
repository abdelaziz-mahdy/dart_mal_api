import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/exts/map_exts.dart';
import 'package:mal_api/src/utils/exts/nullable_exts.dart';
import 'package:mal_api/src/utils/factories/media_factories/media_factory.dart';

abstract class MediaRecommendation {
  final Media? mediaNode;
  final int? numRecommendations;

  MediaRecommendation.fromJsonMap(
    Map<String, dynamic> data, MediaFactory mediaFactory
  ) : mediaNode
      = data.getAs<Map<String, dynamic>>('node').map(mediaFactory.fromJsonMap),
    numRecommendations = data.getAs<int>('num_recommendations');
}
