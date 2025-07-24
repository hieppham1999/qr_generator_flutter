import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:qr_generator_flutter/core/languages.dart';
import 'package:qr_generator_flutter/utils/app_logger.dart';
import 'package:qr_generator_flutter/utils/functions.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  final int currentIndex;
  final void Function(int currentIndex, int targetIndex) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      initialActiveIndex: currentIndex,
      onTap: (targetIndex) {
        onItemTapped(currentIndex, targetIndex);
      },
      cornerRadius: 12,
      height: 60,
      style: TabStyle.fixedCircle,
      activeColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor?.inverted,
      color: Theme.of(context).bottomNavigationBarTheme.backgroundColor?.remarkable,
      backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      // Ensures all items are visible and labels shown
      items: [
        TabItem(
          icon: Icons.home,
          title: Languages.translate.homeTab,
        ),
        // This is our "QR Scan" button in the middle.
        // It doesn't change _currentIndex in the same way if it's purely an action button.
        TabItem(
          icon: Icons.qr_code_scanner,
          title:
              'Scan QR', // Label is optional, can be empty string for just icon
        ),
        const TabItem(
          icon: Icons.person,
          title: 'Profile',
        ),
      ],
    );
  }
}
