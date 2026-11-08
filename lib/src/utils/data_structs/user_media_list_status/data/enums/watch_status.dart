/// Where an anime is in the user's list.
enum WatchStatus {
  /// Watched to the end.
  completed,

  /// Stopped watching.
  dropped,

  /// Paused, to continue later.
  onHold,

  /// Not started yet.
  planToWatch,

  /// Currently watching.
  watching,
}

/// Parsing helpers for [WatchStatus].
class WatchStatusUtils {
  /// Parses the API value, such as `plan_to_watch`.
  ///
  /// Returns `null` for unknown values.
  static WatchStatus? tryParse(String str) {
    switch (str) {
      case 'completed':
        return WatchStatus.completed;
      case 'dropped':
        return WatchStatus.dropped;
      case 'on_hold':
        return WatchStatus.onHold;
      case 'plan_to_watch':
        return WatchStatus.planToWatch;
      case 'watching':
        return WatchStatus.watching;
      default:
        return null;
    }
  }
}

/// Conversions for [WatchStatus].
extension WatchStatusExts on WatchStatus {
  /// The value the API uses for this status, such as `plan_to_watch`.
  String toParamStr() {
    switch (this) {
      case WatchStatus.completed:
        return 'completed';
      case WatchStatus.dropped:
        return 'dropped';
      case WatchStatus.onHold:
        return 'on_hold';
      case WatchStatus.planToWatch:
        return 'plan_to_watch';
      case WatchStatus.watching:
        return 'watching';
    }
  }
}
