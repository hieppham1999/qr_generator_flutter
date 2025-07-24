import 'package:flutter/material.dart';
import 'package:qr_generator_flutter/core/languages.dart';
import 'package:qr_generator_flutter/navigation/app_navigator.dart';
import 'package:qr_generator_flutter/navigation/app_routes.dart';
import 'package:qr_generator_flutter/base/bloc_state_builder.dart';
import 'package:qr_generator_flutter/di/injection.dart';
import 'package:qr_generator_flutter/presentation/features/home_tab/home_tab.dart';
import 'package:qr_generator_flutter/presentation/features/main_screen/main_screen_cubit.dart';
import 'package:qr_generator_flutter/presentation/features/main_screen/main_screen_state.dart';
import 'package:qr_generator_flutter/presentation/widgets/app_scaffold.dart';
import 'package:qr_generator_flutter/presentation/widgets/bottom_navigation_bar.dart';
import 'package:qr_generator_flutter/utils/functions.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController textEditingController = TextEditingController();
  final PageController? controller = PageController();

  final homeCubit = getIt.get<MainScreenCubit>();

  @override
  Widget build(BuildContext context) {
    return CubitStateBuilder<MainScreenState>(
      cubit: homeCubit,
      builder: (_, state) {
        return AppScaffold(
          usePadding: false,
          appBar: AppBar(
            title: Text(Languages.translate.appName),
            actions: [
              if (state.pageIndex == 0)
                IconButton(
                  onPressed: () {
                    NavController.pushNamed(QrCreateRoute());
                  },
                  icon: Icon(Icons.add),
                ),
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
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
                    _buildQrImage(),
                  SizedBox.shrink(),
              _buildSettings(),
            ],
          )
        );
      },
    );
  }

  Widget _buildQrImage() {
    return HomeTab();
  }

  Widget _buildSettings() {
    return Center(child: Text('Settings'));
  }

  void onItemTapped(int currentIndex, int targetIndex) {
    if (targetIndex == 1) {
      // Index of the QR Scan visual item
      _navigateToQrScanner();
      return; // Don't try to set state for a page change for the QR button
    }
    if (targetIndex > 2) {
      controller?.animateToIndex(targetIndex - 1);
      homeCubit.updateTabIndex(targetIndex - 1);
    } else {
      controller?.animateToIndex(targetIndex);
      homeCubit.updateTabIndex(targetIndex);
    }
  }

  void _navigateToQrScanner() {
    NavController.pushNamed(QrScanRoute());
  }
}
