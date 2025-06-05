import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator_flutter/features/home/home_cubit.dart';
import 'package:qr_generator_flutter/features/home/home_state.dart';
import 'package:qr_generator_flutter/navigation/app_navigator.dart';
import 'package:qr_generator_flutter/navigation/app_routes.dart';
import 'package:qr_generator_flutter/base/bloc_state_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:qr_generator_flutter/di/injection.dart';
import 'package:qr_generator_flutter/widgets/bottom_navigation_bar.dart';
import 'package:qr_generator_flutter/widgets/color_picker_dot.dart';

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


    return BlocStateBuilder<HomeState>(
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
    return Column(
      children: [
        TextField(controller: textEditingController),
        if (homeCubit.qrData.content?.isNotEmpty ?? false)
          Builder(
            builder:
                (context) => Column(
                  children: [
                    Row(
                      children: [
                        Text('Qr module color:'),
                        ColorPickerDot(
                          selectedColor: homeCubit.qrData.moduleStyle.color,
                          onChanged:
                              (color) => homeCubit.updateQrModuleColor(color),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Qr eye color:'),
                        ColorPickerDot(
                          selectedColor: homeCubit.qrData.eyeStyle.color,
                          onChanged:
                              (color) => homeCubit.updateQrEyeColor(color),
                        ),
                      ],
                    ),

                    QrImageView(
                      data: homeCubit.qrData.content ?? '',
                      version: QrVersions.auto,
                      eyeStyle: homeCubit.qrData.eyeStyle,
                      dataModuleStyle: homeCubit.qrData.moduleStyle,
                      embeddedImageEmitsError: true,
                      size: 200.0,
                    ),
                    Text(homeCubit.qrData.content ?? ''),
                  ],
                ),
          ),

        ElevatedButton(
          onPressed: () => homeCubit.updateQrData(textEditingController.text),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: Theme.of(context).textTheme.labelLarge,
            minimumSize: Size.fromHeight(
              56,
            ), // fromHeight use double.infinity as width and 40 is the height
          ),
          child: Text(AppLocalizations.of(context)!.btnGenerate),
        ),
      ],
    );
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
