import 'package:mal_api_plus/mal_api_plus.dart';
import 'package:mal_api_plus/src/utils/factories/media_factories/anime_factory.dart';

class RelatedAnime extends RelatedMedia {
  Anime? get node { return mediaNode as Anime?; }

  RelatedAnime.fromJsonMap(Map<String, dynamic> data)
    : super.fromJsonMap(data, const AnimeFactory());
}
