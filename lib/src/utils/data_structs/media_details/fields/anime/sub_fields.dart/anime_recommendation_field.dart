import 'package:mal_api_plus/mal_api_plus.dart';

class AnimeRecommendationField extends Field {
  AnimeRecommendationField.node([List<AnimeField>? fields])
    : super('node', fields);
  AnimeRecommendationField.numRecommendations()
    : super('num_recommendations');
}
