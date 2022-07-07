import 'package:mal_api/mal_api.dart';

abstract class RankedMediaFactory {
  const RankedMediaFactory();

  RankedMedia fromJsonMap(Map<String, dynamic> data);
}
