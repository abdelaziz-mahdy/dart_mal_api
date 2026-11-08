import 'package:mal_api_plus/mal_api_plus.dart';
import 'package:mal_api_plus/src/utils/factories/ranked_media_factories/ranked_media_factory.dart';

class RankedAnimeFactory extends RankedMediaFactory {
  const RankedAnimeFactory();

  @override
  RankedAnime fromJsonMap(Map<String, dynamic> data)
    => RankedAnime.fromJsonMap(data);
}
