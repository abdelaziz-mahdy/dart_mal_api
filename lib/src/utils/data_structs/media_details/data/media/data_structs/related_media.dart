import 'package:mal_api/mal_api.dart';
import 'package:mal_api/src/utils/exts/map_exts.dart';
import 'package:mal_api/src/utils/exts/nullable_exts.dart';
import 'package:mal_api/src/utils/factories/media_factories/media_factory.dart';

abstract class RelatedMedia {
  final Media? mediaNode;
  final RelationType? relationType;
  final String? relationTypeFormatted;

  RelatedMedia.fromJsonMap(
    Map<String, dynamic> data, MediaFactory mediaFactory
  ) : mediaNode
      = data.getAs<Map<String, dynamic>>('node').map(mediaFactory.fromJsonMap),
    relationType
      = data.getAs<String>('relation_type').flatMap(RelationTypeUtils.tryParse),
    relationTypeFormatted = data.getAs<String>('relation_type_formatted');
}
