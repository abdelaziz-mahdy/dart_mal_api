import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/factories/user_media_list_status_factories/user_media_list_status_factory.dart';

class UserMangaListStatusFactory extends UserMediaListStatusFactory {
  const UserMangaListStatusFactory();

  @override
  UserMangaListStatus fromJsonMap(Map<String, dynamic> data)
    => UserMangaListStatus.fromJsonMap(data);
}
