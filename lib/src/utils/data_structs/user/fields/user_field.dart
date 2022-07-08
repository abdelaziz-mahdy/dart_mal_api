import 'package:mal_api/mal_api.dart';

class UserField extends Field {
  UserField.animeStatistics([List<UserAnimeStatisticsField>? fields])
    : super('anime_statistics', fields);
  UserField.birthday() : super('birthday');
  UserField.id() : super('id');
  UserField.gender() : super('gender');
  UserField.isSupporter() : super('is_supporter');
  UserField.joinedAt() : super('joined_at');
  UserField.location() : super('location');
  UserField.name() : super('name');
  UserField.picture() : super('picture');
  UserField.timeZone() : super('time_zone');
}
