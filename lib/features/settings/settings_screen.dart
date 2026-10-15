import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../shared/app_drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings',
            style: TextStyle(fontWeight: FontWeight.w800)),
        backgroundColor: AppColors.bg,
        surfaceTintColor: Colors.transparent,
      ),
      drawer: const AppDrawer(current: AppSection.settings),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: AppColors.accent,
                      child: Text('AR',
                          style: TextStyle(
                              color: AppColors.onAccent,
                              fontWeight: FontWeight.w800)),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Alex Rivera',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 17)),
                          Text('Edit profile',
                              style: TextStyle(
                                  fontSize: 12, color: AppColors.muted)),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right_rounded, color: AppColors.muted),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: const [
                    _Row(Icons.dark_mode_outlined, 'Appearance', value: 'Dark'),
                    _Line(),
                    _Row(Icons.history_rounded, 'History'),
                    _Line(),
                    _Row(Icons.favorite_border_rounded, 'Saved items'),
                    _Line(),
                    _Row(Icons.notifications_none_rounded, 'Notifications'),
                    _Line(),
                    _Row(Icons.info_outline_rounded, 'About'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Line extends StatelessWidget {
  const _Line();
  @override
  Widget build(BuildContext context) =>
      const Divider(height: 1, color: AppColors.surface2);
}

class _Row extends StatelessWidget {
  const _Row(this.icon, this.label, {this.value});
  final IconData icon;
  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      child: ListTile(
        onTap: () {},
        minTileHeight: 56,
        leading: Icon(icon, color: AppColors.accent),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
        trailing: value != null
            ? Text(value!, style: const TextStyle(color: AppColors.muted))
            : const Icon(Icons.chevron_right_rounded, color: AppColors.muted),
      ),
    );
  }
}