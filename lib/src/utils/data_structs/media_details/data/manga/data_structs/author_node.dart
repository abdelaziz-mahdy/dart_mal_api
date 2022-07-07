import 'package:mal_api/src/utils/exts/map_exts.dart';

class AuthorNode {
  final int? id;
  final String? firstName;
  final String? lastName;

  AuthorNode.fromJsonMap(Map<String, dynamic> data)
    : id = data.getAs<int>('id'),
    firstName = data.getAs<String>('first_name'),
    lastName = data.getAs<String>('last_name');
}
