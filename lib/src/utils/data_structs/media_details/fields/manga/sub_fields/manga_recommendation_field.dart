import 'package:mal_api_plus/mal_api_plus.dart';

class MangaRecommendationField extends Field {
  MangaRecommendationField.node([List<MangaField>? fields])
      : super('node', fields);
  MangaRecommendationField.numRecommendations() : super('num_recommendations');
}
