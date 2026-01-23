import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class GNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  GNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: GNav(
          mainAxisAlignment: MainAxisAlignment.center,
          tabBackgroundColor: Colors.grey.shade100,
          tabActiveBorder: Border.all(color: Colors.white),
          onTabChange: (value) => onTabChange!(value),
          tabBorderRadius: 16,
          color: Colors.grey[500],
          gap: 10,
          tabs: [
            GButton(icon: Icons.home, text: 'shop'),
            GButton(icon: Icons.shopping_bag_rounded, text: 'cart'),
          ],
        ),
      ),
    );
  }
}
