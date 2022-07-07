enum RelationType {
  alternativeSetting,
  alternativeVersion,
  fullStory,
  other,
  parentStory,
  prequel,
  sequel,
  sideStory,
  spinOff,
  summary
}

class RelationTypeUtils {
  static RelationType? tryParse(String str) {
    switch (str) {
      case 'alternative_setting':
        return RelationType.alternativeSetting;
      case 'alternative_version':
        return RelationType.alternativeVersion;
      case 'full_story':
        return RelationType.fullStory;
      case 'other':
        return RelationType.other;
      case 'parent_story':
        return RelationType.parentStory;
      case 'prequel':
        return RelationType.prequel;
      case 'sequel':
        return RelationType.sequel;
      case 'side_story':
        return RelationType.sideStory;
      case 'spin_off':
        return RelationType.spinOff;
      case 'summary':
        return RelationType.summary;
      default:
        return null;
    }
  }
}
