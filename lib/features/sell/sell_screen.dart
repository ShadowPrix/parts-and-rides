import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../shared/app_drawer.dart';

class SellScreen extends StatelessWidget {
  const SellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sell', style: TextStyle(fontWeight: FontWeight.w800)),
        backgroundColor: AppColors.bg,
        surfaceTintColor: Colors.transparent,
      ),
      drawer: const AppDrawer(current: AppSection.sell),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.sell_outlined, size: 48, color: AppColors.accent),
            SizedBox(height: 12),
            Text('Your listings will appear here',
                style: TextStyle(fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}