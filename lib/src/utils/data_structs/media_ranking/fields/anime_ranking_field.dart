import 'package:mal_api_plus/mal_api_plus.dart';

class AnimeRankingField extends MediaRankingField {
  AnimeRankingField.node([List<AnimeField>? fields]) : super.node(fields);
  AnimeRankingField.ranking([List<RankingField>? fields])
    : super.ranking(fields);
}
