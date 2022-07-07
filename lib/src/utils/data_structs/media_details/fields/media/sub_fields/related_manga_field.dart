import 'package:mal_api/mal_api.dart';

class RelatedMangaField extends Field {
  RelatedMangaField.node([List<MangaField>? fields]) : super('node', fields);
  RelatedMangaField.relationType() : super('relation_type');
  RelatedMangaField.relationTypeFormatted() : super('relation_type_formatted');
}
