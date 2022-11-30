import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lector_qr/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    return BottomNavigationBar(
      onTap: (value) => uiProvider.selectedMenuOpt = value,
      currentIndex: currentIndex,
      elevation: 0.0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assistant_direction),
          label: 'Dirección',
        ),
      ],
    );
  }
}
