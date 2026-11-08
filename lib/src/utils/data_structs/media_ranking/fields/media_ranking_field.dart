import 'package:mal_api_plus/mal_api_plus.dart';

class MediaRankingField extends Field {
  MediaRankingField.node([List<MediaField>? fields]) : super('node', fields);
  MediaRankingField.ranking([List<RankingField>? fields])
      : super('ranking', fields);
}
