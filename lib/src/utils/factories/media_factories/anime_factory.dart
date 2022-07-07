import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/factories/media_factories/media_factory.dart';

class AnimeFactory extends MediaFactory {
  const AnimeFactory();

  @override
  Anime fromJsonMap(Map<String, dynamic> data) => Anime.fromJsonMap(data);
}
