import 'package:mal_api_plus/mal_api_plus.dart';

class RelatedMangaField extends Field {
  RelatedMangaField.node([List<MangaField>? fields]) : super('node', fields);
  RelatedMangaField.relationType() : super('relation_type');
  RelatedMangaField.relationTypeFormatted() : super('relation_type_formatted');
}
