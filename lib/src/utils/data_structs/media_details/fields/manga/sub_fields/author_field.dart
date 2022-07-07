import 'package:mal_api/mal_api.dart';

class AuthorField extends Field {
  AuthorField.node([List<AuthorNodeField>? fields]) : super('node', fields);
  AuthorField.role() : super('role');
}
