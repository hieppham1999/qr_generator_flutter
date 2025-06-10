import 'package:flutter/material.dart';
import 'package:qr_generator_flutter/features/home/home_cubit.dart';
import 'package:qr_generator_flutter/features/home/home_state.dart';
import 'package:qr_generator_flutter/navigation/app_navigator.dart';
import 'package:qr_generator_flutter/navigation/app_routes.dart';
import 'package:qr_generator_flutter/base/bloc_state_builder.dart';
import 'package:qr_generator_flutter/di/injection.dart';
import 'package:qr_generator_flutter/widgets/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textEditingController = TextEditingController();

  final homeCubit = getIt.get<HomeCubit>();

  @override
  Widget build(BuildContext context) {


    return CubitStateBuilder<HomeState>(
      cubit: homeCubit,
      builder:
          (_, state) {
            return Scaffold(
            appBar: AppBar(
              title: Text("HomePage"),
              actions: [
                IconButton(
                  onPressed: () {
                    NavController.pushNamed(SettingsRoute());
                  },
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
            bottomNavigationBar: AppBottomNavigationBar(
              currentIndex: state.pageIndex,
              onItemTapped: onItemTapped,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: switch (state.pageIndex) {
                0 => _buildQrImage(),
                1 => SizedBox.shrink(),
                2 => _buildSettings(),
                _ => SizedBox.shrink(),
              },
            ),
          );
          },


    );
  }

  Widget _buildQrImage() {
    return Center(
        child: ElevatedButton(onPressed: () {
          NavController.pushNamed(QrCreateRoute());
        }, child: Text("Create QR")));
  }

  Widget _buildSettings() {
    return Center(child: Text('Settings'));
  }

  void onItemTapped(int index) {
    if (index == 1) {
      // Index of the QR Scan visual item
      _navigateToQrScanner();
      return; // Don't try to set state for a page change for the QR button
    }
    setState(() {
      if (index > 2) {
        homeCubit.updateTabIndex(index - 1);
      } else {
        homeCubit.updateTabIndex(index);
      }
    });
  }

  void _navigateToQrScanner() {
    NavController.pushNamed(QrScanRoute());
  }
}
