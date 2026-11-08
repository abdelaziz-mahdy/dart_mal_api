import 'package:mal_api_plus/mal_api_plus.dart';
import 'package:mal_api_plus/src/utils/factories/user_media_list_status_factories/user_media_list_status_factory.dart';

class UserMangaListStatusFactory extends UserMediaListStatusFactory {
  const UserMangaListStatusFactory();

  @override
  UserMangaListStatus fromJsonMap(Map<String, dynamic> data)
    => UserMangaListStatus.fromJsonMap(data);
}
