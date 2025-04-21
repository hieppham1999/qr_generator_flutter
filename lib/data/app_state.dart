import 'package:equatable/equatable.dart';

sealed class CubitState<S> extends Equatable {
  final S? data;

  const CubitState({this.data});

  @override
  List<Object?> get props => [data];

  factory CubitState.normal(S data) => NormalState(data);
  factory CubitState.loading([S? data]) => LoadingState(data: data);
  factory CubitState.error(String message, [S? data]) => ErrorState(data: data, message: message);
}

class NormalState<S> extends CubitState<S> {
  const NormalState(S state) : super(data: state);
}

class LoadingState<S> extends CubitState<S> {
  const LoadingState({super.data});
}

class ErrorState<S> extends CubitState<S> {
  final String message;

  const ErrorState({super.data, required this.message});

  @override
  List<Object?> get props => [data, message];
}
