import 'package:mal_api_plus/mal_api_plus.dart';

class SerializationField extends Field {
  SerializationField.node([List<SerializationNodeField>? fields])
      : super('node', fields);
  SerializationField.role() : super('role');
}
