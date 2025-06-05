import 'package:flutter/material.dart';
import 'package:qr_generator_flutter/core/languages.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      // Visually indicates which regular tab is active
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      // Ensures all items are visible and labels shown
      selectedItemColor: Colors.amber[800],
      // Optional: Color for selected item
      unselectedItemColor: Colors.grey,
      // Optional: Color for unselected items
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: Languages.translate.homeTab,
        ),
        // This is our "QR Scan" button in the middle.
        // It doesn't change _currentIndex in the same way if it's purely an action button.
        BottomNavigationBarItem(
          icon: Container(
            // Wrap with Container for custom styling if needed
            padding: const EdgeInsets.all(8.0),
            // Add padding if you want it larger
            decoration: BoxDecoration(
              // color: Colors.blue, // Optional: different background for emphasis
              // shape: BoxShape.circle, // Optional: make it circular
            ),
            child: const Icon(
              Icons.qr_code_scanner,
              size: 30,
            ), // Slightly larger icon
          ),
          label:
              'Scan QR', // Label is optional, can be empty string for just icon
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
