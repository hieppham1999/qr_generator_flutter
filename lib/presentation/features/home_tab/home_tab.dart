import 'package:flutter/material.dart';
import 'package:qr_generator_flutter/base/bloc_state_builder.dart';
import 'package:qr_generator_flutter/di/injection.dart';
import 'package:qr_generator_flutter/navigation/app_navigator.dart';
import 'package:qr_generator_flutter/navigation/app_routes.dart';
import 'package:qr_generator_flutter/presentation/features/home_tab/home_tab_cubit.dart';
import 'package:qr_generator_flutter/presentation/features/home_tab/home_tab_state.dart';
import 'package:qr_generator_flutter/presentation/widgets/qr_card_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  final cubit = getIt.get<HomeTabCubit>();

  @override
  void initState() {
    cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CubitStateBuilder<HomeTabState>(
      cubit: cubit,
      builder: (_, state) => state.listQr.isEmpty ? Center(
          child: ElevatedButton(onPressed: () {
            NavController.pushNamed(QrCreateRoute());
          }, child: Text("Create QR"))) :
        ListView.builder(
        itemCount: state.listQr.length,
        itemBuilder: (context, index) {

          final item = state.listQr[index];


          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     item.createdAt.toString(),
              //     style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //   ),
              // ),
              QrCard(qr: item),
            ],
          );
        },
      ),
    );
  }
}
