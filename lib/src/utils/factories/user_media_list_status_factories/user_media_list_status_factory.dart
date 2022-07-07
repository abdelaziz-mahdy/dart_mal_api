import 'package:mal_api/mal_api.dart';

abstract class UserMediaListStatusFactory {
  const UserMediaListStatusFactory();

  UserMediaListStatus fromJsonMap(Map<String, dynamic> data);
}
