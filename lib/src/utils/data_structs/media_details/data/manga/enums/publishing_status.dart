enum PublishingStatus {
  currentlyPublishing,
  finished,
  notYetPublished
}

class PublishingStatusUtils {
  static PublishingStatus? tryParse(String str) {
    switch (str) {
      case 'currently_publishing':
        return PublishingStatus.currentlyPublishing;
      case 'finished':
        return PublishingStatus.finished;
      case 'not_yet_published':
        return PublishingStatus.notYetPublished;
      default:
        return null;
    }
  }
}
