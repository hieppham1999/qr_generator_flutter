import 'package:equatable/equatable.dart';

sealed class CubitState {
  // final S? data;
  //
  // const CubitState({this.data});
  //
  // @override
  // List<Object?> get props => [data];
  //
  // factory CubitState.normal(S data) => NormalState(data);
  // factory CubitState.loading([S? data]) => LoadingState(data: data);
  // factory CubitState.error(String message, [S? data]) => ErrorState(data: data, message: message);
}

class NormalState extends CubitState {
  NormalState();
}

class LoadingState extends CubitState {
  LoadingState();
}

class ErrorState extends CubitState {
  final String message;

  ErrorState({required this.message});
}
