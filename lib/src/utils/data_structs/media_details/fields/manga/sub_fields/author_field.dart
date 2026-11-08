import 'package:mal_api_plus/mal_api_plus.dart';

class AuthorField extends Field {
  AuthorField.node([List<AuthorNodeField>? fields]) : super('node', fields);
  AuthorField.role() : super('role');
}
