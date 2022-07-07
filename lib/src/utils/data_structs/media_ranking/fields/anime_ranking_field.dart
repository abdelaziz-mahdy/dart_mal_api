import 'package:mal_api/mal_api.dart';

class AnimeRankingField extends MediaRankingField {
  AnimeRankingField.node([List<AnimeField>? fields]) : super.node(fields);
  AnimeRankingField.ranking([List<RankingField>? fields])
    : super.ranking(fields);
}
