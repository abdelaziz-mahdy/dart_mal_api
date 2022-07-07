import 'package:mal_api/src/utils/exts/map_exts.dart';

class AlternativeTitles {
  final List<String>? synonyms;
  final String? en;
  final String? ja;

  AlternativeTitles.fromJsonMap(Map<String, dynamic> data)
    : synonyms
      = data
        .getAs<List<dynamic>>('synonyms')
        ?.map((e) => e.toString())
        .toList(),
    en = data.getAs<String>('en'),
    ja = data.getAs<String>('ja');
}
