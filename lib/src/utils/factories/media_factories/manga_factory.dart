import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/factories/media_factories/media_factory.dart';

class MangaFactory extends MediaFactory {
  const MangaFactory();

  @override
  Manga fromJsonMap(Map<String, dynamic> data) => Manga.fromJsonMap(data);
}
