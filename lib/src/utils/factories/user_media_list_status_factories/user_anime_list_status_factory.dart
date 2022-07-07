import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/factories/user_media_list_status_factories/user_media_list_status_factory.dart';

class UserAnimeListStatusFactory extends UserMediaListStatusFactory {
  const UserAnimeListStatusFactory();

  @override
  UserAnimeListStatus fromJsonMap(Map<String, dynamic> data)
    => UserAnimeListStatus.fromJsonMap(data);
}
