import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example/features/settings/models/settings.dart';
import 'package:auto_route_example/utils/routing/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [Settings.profile, Settings.controls]
            .map(
              (type) => ListTile(
                title: Text(type.title),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => onSettingsTileTapped(context, type),
              ),
            )
            .toList(),
      ),
    );
  }

  void onSettingsTileTapped(BuildContext context, Settings type) {
    switch (type) {
      case Settings.profile:
        context.pushRoute(const ProfileRoute());
        break;
      case Settings.controls:
        context.pushRoute(const ControlsRoute());
        break;
    }
  }
}
