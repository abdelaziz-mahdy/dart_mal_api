import 'package:mal_api_plus/mal_api_plus.dart';

abstract class RankedMediaFactory {
  const RankedMediaFactory();

  RankedMedia fromJsonMap(Map<String, dynamic> data);
}
