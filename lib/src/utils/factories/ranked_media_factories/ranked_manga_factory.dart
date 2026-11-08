import 'package:mal_api_plus/mal_api_plus.dart';
import 'package:mal_api_plus/src/utils/factories/ranked_media_factories/ranked_media_factory.dart';

class RankedMangaFactory extends RankedMediaFactory {
  const RankedMangaFactory();

  @override
  RankedManga fromJsonMap(Map<String, dynamic> data) =>
      RankedManga.fromJsonMap(data);
}
