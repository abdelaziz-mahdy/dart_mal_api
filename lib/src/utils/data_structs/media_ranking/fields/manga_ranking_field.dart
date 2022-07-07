import 'package:mal_api/mal_api.dart';

class MangaRankingField extends MediaRankingField {
  MangaRankingField.node([List<MangaField>? fields]) : super.node(fields);
  MangaRankingField.ranking([List<RankingField>? fields])
    : super.ranking(fields);
}
