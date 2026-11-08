extension NullableExts<T> on T? {
  U? flatMap<U>(U? Function(T) func) => this == null ? null : func(this as T);

  U? map<U>(U Function(T) func) => this == null ? null : func(this as T);
}
