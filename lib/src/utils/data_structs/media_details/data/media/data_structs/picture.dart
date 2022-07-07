import 'package:mal_api/src/utils/exts/map_exts.dart';
import 'package:mal_api/src/utils/exts/nullable_exts.dart';

class Picture {
  final Uri? large;
  final Uri? medium;

  Picture.fromJsonMap(Map<String, dynamic> data)
    : large = data.getAs<String>('large').map(Uri.parse),
    medium = data.getAs<String>('medium').map(Uri.parse);
}
