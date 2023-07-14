import 'package:auto_route_example/utils/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

void main() => runApp(AutoRouteExample());

class AutoRouteExample extends StatefulWidget {
  AutoRouteExample({super.key});

  @override
  State<AutoRouteExample> createState() => _AutoRouteExampleState();
}

class _AutoRouteExampleState extends State<AutoRouteExample> {
  final _appRouter = AppRouter();

  String deepLink = '/';

  @override
  void initState() {
    super.initState();
    handleIncomingDeepLinks();
    handleInitialDeepLink();
  }

  void handleIncomingDeepLinks() {
    linkStream.listen((link) {
      deepLink = link ?? '/';
    });
  }

  Future<void> handleInitialDeepLink() async {
    final link = await getInitialLink();
    if (link != null) {
      deepLink = link;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
