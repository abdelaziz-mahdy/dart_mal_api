enum AiringStatus {
  currentlyAiring,
  finishedAiring,
  notYetAired
}

class AiringStatusUtils {
  static AiringStatus? tryParse(String str) {
    switch (str) {
      case 'currently_airing':
        return AiringStatus.currentlyAiring;
      case 'finished_airing':
        return AiringStatus.finishedAiring;
      case 'not_yet_aired':
        return AiringStatus.notYetAired;
      default:
        return null;
    }
  }
}
