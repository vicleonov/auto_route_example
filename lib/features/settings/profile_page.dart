import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          onPressed: context.router.pop,
          icon: const Icon(Icons.arrow_back_ios_new),
          splashRadius: 24,
        ),
      ),
      body: const Center(
        child: Text('Profile'),
      ),
    );
  }
}
