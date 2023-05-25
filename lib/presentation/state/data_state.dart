enum DataState {
  inital,
  loading,
  success,
  error;

  bool get isSuccess => this == success;
}
