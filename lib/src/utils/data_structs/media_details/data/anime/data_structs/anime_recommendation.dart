import 'package:mal_api_plus/mal_api_plus.dart';
import 'package:mal_api_plus/src/utils/factories/media_factories/anime_factory.dart';

class AnimeRecommendation extends MediaRecommendation {
  Anime? get node => mediaNode as Anime;

  AnimeRecommendation.fromJsonMap(Map<String, dynamic> data)
    : super.fromJsonMap(data, const AnimeFactory());
}
