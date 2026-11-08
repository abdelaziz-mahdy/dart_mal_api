import 'package:mal_api_plus/mal_api_plus.dart';

abstract class UserMediaListStatusFactory {
  const UserMediaListStatusFactory();

  UserMediaListStatus fromJsonMap(Map<String, dynamic> data);
}
