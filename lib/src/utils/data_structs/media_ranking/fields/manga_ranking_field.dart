import 'package:mal_api_plus/mal_api_plus.dart';

class MangaRankingField extends MediaRankingField {
  MangaRankingField.node([List<MangaField>? fields]) : super.node(fields);
  MangaRankingField.ranking([List<RankingField>? fields])
    : super.ranking(fields);
}
