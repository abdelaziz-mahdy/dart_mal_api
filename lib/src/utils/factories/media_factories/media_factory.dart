import 'package:mal_api_plus/mal_api_plus.dart';

abstract class MediaFactory {
  const MediaFactory();

  Media fromJsonMap(Map<String, dynamic> data);
}
