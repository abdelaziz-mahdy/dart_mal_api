enum WatchStatus {
  completed,
  dropped,
  onHold,
  planToWatch,
  watching
}

class WatchStatusUtils {
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

extension WatchStatusExts on WatchStatus {
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
