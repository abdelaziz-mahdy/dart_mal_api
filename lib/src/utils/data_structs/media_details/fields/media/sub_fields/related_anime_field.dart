import 'package:mal_api_plus/mal_api_plus.dart';

class RelatedAnimeField extends Field {
  RelatedAnimeField.node([List<AnimeField>? fields]) : super('node', fields);
  RelatedAnimeField.relationType() : super('relation_type');
  RelatedAnimeField.relationTypeFormatted() : super('relation_type_formatted');
}
