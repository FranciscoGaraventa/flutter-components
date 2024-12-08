sealed class BlocResult<T> {}

class Success<T> extends BlocResult<T> {
  Success({
    required this.data,
  });

  T data;
}

class Failure<T> extends BlocResult<T> {
  Failure({
    required this.error,
  });

  String error;
}

class Loading<T> extends BlocResult<T> {}
