import 'package:mal_api/mal_api.dart';

abstract class MediaFactory {
  const MediaFactory();

  Media fromJsonMap(Map<String, dynamic> data);
}
