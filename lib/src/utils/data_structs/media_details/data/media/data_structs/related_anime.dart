import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/factories/media_factories/anime_factory.dart';

class RelatedAnime extends RelatedMedia {
  Anime? get node { return mediaNode as Anime?; }

  RelatedAnime.fromJsonMap(Map<String, dynamic> data)
    : super.fromJsonMap(data, const AnimeFactory());
}
