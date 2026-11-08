import 'package:mal_api_plus/mal_api_plus.dart';

class AnimeRankingField extends MediaRankingField {
  AnimeRankingField.node([List<AnimeField>? super.fields]) : super.node();
  AnimeRankingField.ranking([super.fields]) : super.ranking();
}
