import 'package:mal_api/mal_api.dart';

class MediaRankingField extends Field {
  MediaRankingField.node([List<MediaField>? fields]) : super('node', fields);
  MediaRankingField.ranking([List<RankingField>? fields])
    : super('ranking', fields);
}
