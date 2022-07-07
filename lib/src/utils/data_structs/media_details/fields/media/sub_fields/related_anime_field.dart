import 'package:mal_api/mal_api.dart';

class RelatedAnimeField extends Field {
  RelatedAnimeField.node([List<AnimeField>? fields]) : super('node', fields);
  RelatedAnimeField.relationType() : super('relation_type');
  RelatedAnimeField.relationTypeFormatted() : super('relation_type_formatted');
}
