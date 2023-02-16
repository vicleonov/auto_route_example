import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:auto_route_example/features/dashboard/dashboard_page.dart';
import 'package:auto_route_example/features/home_page/home_page.dart';
import 'package:auto_route_example/features/login/login_page.dart';
import 'package:auto_route_example/features/settings/controls_page.dart';
import 'package:auto_route_example/features/settings/profile_page.dart';
import 'package:auto_route_example/features/settings/settings_page.dart';
import 'package:auto_route_example/features/tasks/tasks_page.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

// const homePath = 'home';
// const dashboardPath = 'dashboard';
// const tasksPath = 'tasks';
// const settingsPath = 'settings';
// const loginPath = 'login';
// const profilePath = 'profile';
// const controlsPath = 'controls';

class RoutePaths {
  static const String splash = '/';
  static const String login = 'login';
  static const String home = 'home';
  static const String dashboard = 'dashboard';
  static const String profile = 'profile';
  static const String controls = 'controls';
  static const String tasks = 'tasks';
  static const String settings = 'settings';
}

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(path: RoutePaths.login, page: LoginPage),
    AutoRoute(
      path: '/',
      page: HomePage,
      children: [
        AutoRoute(path: RoutePaths.dashboard, page: DashboardPage),
        AutoRoute(path: RoutePaths.tasks, page: TasksPage),
        AutoRoute(
          path: RoutePaths.settings,
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: SettingsPage, initial: true),
            CustomRoute(
              page: ProfilePage,
              transitionsBuilder: TransitionsBuilders.zoomIn,
              fullscreenDialog: true,
            ),
          ],
        ),
      ],
    ),
    AutoRoute(
      path: RoutePaths.controls,
      page: ControlsPage,
    ),
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
