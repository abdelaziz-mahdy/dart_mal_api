/// Where a manga is in the user's list.
enum ReadStatus {
  /// Read to the end.
  completed,

  /// Stopped reading.
  dropped,

  /// Paused, to continue later.
  onHold,

  /// Not started yet.
  planToRead,

  /// Currently reading.
  reading,
}

/// Parsing helpers for [ReadStatus].
class ReadStatusUtils {
  /// Parses the API value, such as `plan_to_read`.
  ///
  /// Returns `null` for unknown values.
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

/// Conversions for [ReadStatus].
extension ReadStatusExts on ReadStatus {
  /// The value the API uses for this status, such as `plan_to_read`.
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
