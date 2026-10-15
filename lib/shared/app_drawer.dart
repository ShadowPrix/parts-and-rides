import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../features/buy/home_screen.dart';
import '../features/sell/sell_screen.dart';
import '../features/settings/settings_screen.dart';

enum AppSection { buy, sell, settings }

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, required this.current});
  final AppSection current;

  void _go(BuildContext context, AppSection target) {
    Navigator.pop(context); // close the drawer
    if (target == current) return;
    final Widget page = switch (target) {
      AppSection.buy => const HomeScreen(),
      AppSection.sell => const SellScreen(),
      AppSection.settings => const SettingsScreen(),
    };
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      width: 300,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.accent,
                    child: Text('AR',
                        style: TextStyle(
                            color: AppColors.onAccent,
                            fontWeight: FontWeight.w800,
                            fontSize: 16)),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Alex Rivera',
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 17)),
                      Text('Verified seller',
                          style:
                              TextStyle(fontSize: 12, color: AppColors.muted)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 28),
              const Padding(
                padding: EdgeInsets.only(left: 14, bottom: 10),
                child: Text('I WANT TO',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                        color: AppColors.muted)),
              ),
              _Item(Icons.shopping_bag_outlined, 'Buy',
                  current == AppSection.buy, () => _go(context, AppSection.buy)),
              _Item(Icons.sell_outlined, 'Sell', current == AppSection.sell,
                  () => _go(context, AppSection.sell)),
              const Divider(height: 28, color: AppColors.surface2),
              _Item(Icons.tune_rounded, 'Settings',
                  current == AppSection.settings,
                  () => _go(context, AppSection.settings)),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.icon, this.label, this.selected, this.onTap);
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: ListTile(
        onTap: onTap,
        selected: selected,
        selectedColor: AppColors.accent,
        selectedTileColor: const Color(0xFF2A2118),
        iconColor: AppColors.text,
        textColor: AppColors.text,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        minTileHeight: 52,
        leading: Icon(icon),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
      ),
    );
  }
}