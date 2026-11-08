import 'package:mal_api_plus/mal_api_plus.dart';
import 'package:mal_api_plus/src/utils/exts/map_exts.dart';
import 'package:mal_api_plus/src/utils/exts/nullable_exts.dart';

/// A MyAnimeList user profile.
class User {
  /// Summary of the user's anime list.
  final UserAnimeStatistics? animeStatistics;

  /// The user's birthday, if they made it public.
  final DateTime? birthday;

  /// MyAnimeList ID of the user.
  final int? id;

  /// The user's gender, if they made it public.
  final String? gender;

  /// Whether the user is a MyAnimeList Supporter.
  final bool? isSupporter;

  /// When the user created their account.
  final DateTime? joinedAt;

  /// The user's location, if they made it public.
  final String? location;

  /// User name.
  final String? name;

  /// Profile picture.
  final Uri? picture;

  /// The user's time zone, for example `Asia/Tokyo`.
  final String? timeZone;

  /// Creates a user from a MyAnimeList API JSON object.
  User.fromJsonMap(Map<String, dynamic> data)
      : animeStatistics = data
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
