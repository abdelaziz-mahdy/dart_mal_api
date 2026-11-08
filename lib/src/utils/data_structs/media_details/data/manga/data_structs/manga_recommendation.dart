import 'package:mal_api_plus/mal_api_plus.dart';
import 'package:mal_api_plus/src/utils/factories/media_factories/manga_factory.dart';

class MangaRecommendation extends MediaRecommendation {
  Manga? get node => mediaNode as Manga?;

  MangaRecommendation.fromJsonMap(Map<String, dynamic> data)
      : super.fromJsonMap(data, const MangaFactory());
}
