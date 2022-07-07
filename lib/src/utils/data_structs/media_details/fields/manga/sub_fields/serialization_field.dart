import 'package:mal_api/mal_api.dart';

class SerializationField extends Field {
  SerializationField.node([List<SerializationNodeField>? fields]) : super('node', fields);
  SerializationField.role() : super('role');
}
