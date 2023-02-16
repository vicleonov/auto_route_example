import 'package:flutter/material.dart';

enum TabItems {
  dashboard(label: 'Dashboard', icon: Icons.home),
  tasks(label: 'Tasks', icon: Icons.list),
  setting(label: 'Settings', icon: Icons.settings);

  const TabItems({required this.label, required this.icon});

  final String label;
  final IconData icon;
}