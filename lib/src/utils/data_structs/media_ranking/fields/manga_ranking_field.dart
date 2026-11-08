import 'package:mal_api_plus/mal_api_plus.dart';

class MangaRankingField extends MediaRankingField {
  MangaRankingField.node([List<MangaField>? super.fields]) : super.node();
  MangaRankingField.ranking([super.fields]) : super.ranking();
}
