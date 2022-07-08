import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/exts/map_exts.dart';
import 'package:mal_api/src/utils/exts/nullable_exts.dart';

class User {
  final UserAnimeStatistics? animeStatistics;
  final DateTime? birthday;
  final int? id;
  final String? gender;
  final bool? isSupporter;
  final DateTime? joinedAt;
  final String? location;
  final String? name;
  final Uri? picture;
  final String? timeZone;

  User.fromJsonMap(Map<String, dynamic> data)
    : animeStatistics
        = data
          .getAs<Map<String, dynamic>>('anime_statistics')
          .map(UserAnimeStatistics.fromJsonMap),
      birthday = data.getAs<String>('birthday').map(DateTime.parse),
      id = data.getAs<int>('id'),
      gender = data.getAs<String>('gender'),
      isSupporter = data.getAs<bool>('is_supporter'),
      joinedAt = data.getAs<String>('joined_at').map(DateTime.parse),
      location = data.getAs<String>('location'),
      name = data.getAs<String>('name'),
      picture = data.getAs<String>('picture').map(Uri.parse),
      timeZone = data.getAs<String>('time_zone');
}
