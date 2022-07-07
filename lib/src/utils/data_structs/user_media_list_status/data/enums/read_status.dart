enum ReadStatus {
  completed,
  dropped,
  onHold,
  planToRead,
  reading
}

class ReadStatusUtils {
  static ReadStatus? tryParse(String str) {
    switch (str) {
      case 'completed':
        return ReadStatus.completed;
      case 'dropped':
        return ReadStatus.dropped;
      case 'on_hold':
        return ReadStatus.onHold;
      case 'plan_to_read':
        return ReadStatus.planToRead;
      case 'reading':
        return ReadStatus.reading;
      default:
        return null;
    }
  }
}

extension ReadStatusExts on ReadStatus {
  String toParamStr() {
    switch (this) {
      case ReadStatus.completed:
        return 'completed';
      case ReadStatus.dropped:
        return 'dropped';
      case ReadStatus.onHold:
        return 'on_hold';
      case ReadStatus.planToRead:
        return 'plan_to_read';
      case ReadStatus.reading:
        return 'reading';
    }
  }
}
