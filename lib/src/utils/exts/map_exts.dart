extension MapExts<T, U> on Map<T, U> {
  U? get(T key) => containsKey(key) ? this[key] : null;

  V? getAs<V>(T key) => get(key) as V?;
}
