import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/factories/media_factories/manga_factory.dart';

class RankedManga extends RankedMedia {
  Manga? get node { return mediaNode as Manga?; }

  RankedManga.fromJsonMap(Map<String, dynamic> data)
    : super.fromJsonMap(data, const MangaFactory());
}
