import 'package:mal_api/mal_api.dart';

class MangaRecommendationField extends Field {
  MangaRecommendationField.node([List<MangaField>? fields])
    : super('node', fields);
  MangaRecommendationField.numRecommendations() : super('num_recommendations');
}
