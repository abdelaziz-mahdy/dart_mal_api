import 'package:mal_api_plus/mal_api_plus.dart';
import 'package:mal_api_plus/src/utils/factories/media_factories/media_factory.dart';

class AnimeFactory extends MediaFactory {
  const AnimeFactory();

  @override
  Anime fromJsonMap(Map<String, dynamic> data) => Anime.fromJsonMap(data);
}
