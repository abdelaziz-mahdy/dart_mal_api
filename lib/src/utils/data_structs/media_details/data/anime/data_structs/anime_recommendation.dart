import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/factories/media_factories/anime_factory.dart';

class AnimeRecommendation extends MediaRecommendation {
  Anime? get node => mediaNode as Anime;

  AnimeRecommendation.fromJsonMap(Map<String, dynamic> data)
    : super.fromJsonMap(data, const AnimeFactory());
}
