import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example/features/home_page/models/tab_items.dart';
import 'package:auto_route_example/utils/routing/router.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      animationDuration: Duration.zero,
      routes: const [
        DashboardRoute(),
        TasksRoute(),
        EmptyRouterRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [TabItems.dashboard, TabItems.tasks, TabItems.setting].map(
              (tab) {
                return BottomNavigationBarItem(
                  label: tab.label,
                  icon: Icon(tab.icon),
                );
              },
            ).toList());
      },
    );
  }
}
