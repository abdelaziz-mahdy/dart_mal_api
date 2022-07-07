import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/factories/ranked_media_factories/ranked_media_factory.dart';

class RankedMangaFactory extends RankedMediaFactory {
  const RankedMangaFactory();

  @override
  RankedManga fromJsonMap(Map<String, dynamic> data)
    => RankedManga.fromJsonMap(data);
}
