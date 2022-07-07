import 'package:mal_api/mal_api.dart';

class AnimeRecommendationField extends Field {
  AnimeRecommendationField.node([List<AnimeField>? fields])
    : super('node', fields);
  AnimeRecommendationField.numRecommendations()
    : super('num_recommendations');
}
