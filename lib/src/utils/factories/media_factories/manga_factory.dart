import 'package:mal_api_plus/mal_api_plus.dart';
import 'package:mal_api_plus/src/utils/factories/media_factories/media_factory.dart';

class MangaFactory extends MediaFactory {
  const MangaFactory();

  @override
  Manga fromJsonMap(Map<String, dynamic> data) => Manga.fromJsonMap(data);
}
