import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/factories/media_factories/manga_factory.dart';

class RelatedManga extends RelatedMedia {
  Manga? get node { return mediaNode as Manga?; }

  RelatedManga.fromJsonMap(Map<String, dynamic> data)
    : super.fromJsonMap(data, const MangaFactory());
}
