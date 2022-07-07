import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/factories/media_factories/anime_factory.dart';

class RankedAnime extends RankedMedia {
  Anime? get node { return mediaNode as Anime?; }

  RankedAnime.fromJsonMap(Map<String, dynamic> data)
    : super.fromJsonMap(data, const AnimeFactory());
}
