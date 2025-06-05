import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:qr_generator_flutter/utils/app_logger.dart';
import 'package:qr_generator_flutter/base/app_state.dart';

typedef ChildStateBuilder<T> = Widget Function(BuildContext context, T state);

/// A BlocConsumer wrapper
class BlocStateBuilder<T> extends StatefulWidget {
  const BlocStateBuilder({
    super.key,
    required this.builder,
    required this.cubit,
    this.loadingBuilder,
    this.errorBuilder,
  });

  final Cubit<CubitState> cubit;
  final ChildStateBuilder<T> builder;
  final ChildStateBuilder<T>? loadingBuilder;
  final ChildStateBuilder<T>? errorBuilder;

  @override
  State<BlocStateBuilder<T>> createState() => _BlocStateBuilderState<T>();
}

class _BlocStateBuilderState<T> extends State<BlocStateBuilder<T>> {
  final logger = GetIt.I<AppLogger>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Cubit<CubitState>, CubitState>(
      bloc: widget.cubit,
      listener: (context, state) {
        logger.d(
          "${widget.cubit.runtimeType}: New state -> ${state.toString()}",
        );
      },
      builder: (context, state) {
        switch (state) {
          case NormalState():
            return widget.builder.call(context, state.data);
          case LoadingState():
            return widget.loadingBuilder?.call(context, state.data) ?? Center(child: CircularProgressIndicator(),);
          case ErrorState():
            return widget.errorBuilder?.call(context, state.data) ?? Center(child: Text(state.message));
        }
      },
      buildWhen: (oldState, newState) {
        switch (newState) {
          case NormalState():
            return true;
          case LoadingState():
            return true;
          case ErrorState():
            return true;
        }
      },
    );
  }
}
