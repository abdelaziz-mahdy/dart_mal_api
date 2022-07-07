import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/factories/ranked_media_factories/ranked_media_factory.dart';

class RankedAnimeFactory extends RankedMediaFactory {
  const RankedAnimeFactory();

  @override
  RankedAnime fromJsonMap(Map<String, dynamic> data)
    => RankedAnime.fromJsonMap(data);
}
