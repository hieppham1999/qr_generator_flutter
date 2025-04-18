sealed class CubitState<S>{
  final S? state;

  CubitState({this.state});
}

class NormalState<S> extends CubitState<S> {
}

class LoadingState extends CubitState {}

class ErrorState extends CubitState {
  final String message;

  ErrorState({required this.message});
}
