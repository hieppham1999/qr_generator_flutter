import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:qr_generator_flutter/utils/app_logger.dart';
import 'package:qr_generator_flutter/data/app_state.dart';

typedef ChildStateBuilder =
    Widget Function(BuildContext context, CubitState state);

/// A BlocConsumer wrapper
class BlocStateBuilder extends StatefulWidget {
  const BlocStateBuilder({
    super.key,
    required this.builder,
    required this.cubit,
  });

  final Cubit<CubitState> cubit;
  final ChildStateBuilder builder;

  @override
  State<BlocStateBuilder> createState() => _BlocStateBuilderState();
}

class _BlocStateBuilderState extends State<BlocStateBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: widget.cubit,
      listener:
          (context, state)  {
            final logger = GetIt.I<AppLogger>();
            logger.d("${widget.cubit.runtimeType}: New state -> ${state.toString()}");

          },
      builder: widget.builder,
      buildWhen: (oldState, newState) {
        return true;
      },
    );
  }
}
