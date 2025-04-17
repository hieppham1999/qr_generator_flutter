sealed class CubitState {}

class NormalState extends CubitState {}

class LoadingState extends CubitState {}

class ErrorState extends CubitState {
  final String message;

  ErrorState({required String this.message});
}
