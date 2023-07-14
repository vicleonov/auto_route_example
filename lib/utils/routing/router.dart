import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example/features/dashboard/dashboard_page.dart';
import 'package:auto_route_example/features/home_page/home_page.dart';
import 'package:auto_route_example/features/login/login_page.dart';
import 'package:auto_route_example/features/settings/controls_page.dart';
import 'package:auto_route_example/features/settings/empty_page.dart';
import 'package:auto_route_example/features/settings/profile_page.dart';
import 'package:auto_route_example/features/settings/settings_page.dart';
import 'package:auto_route_example/features/tasks/tasks_page.dart';

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
  static const String login = '/login';
  static const String home = '/home';
  static const String controls = '/controls';
  static const String dashboard = 'dashboard';
  static const String profile = 'profile';
  static const String tasks = 'tasks';
  static const String settings = 'settings';
  static const String empty = 'empty';
}

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: RoutePaths.login,
          page: LoginRoute.page,
        ),
        AutoRoute(
          initial: true,
          page: HomeRoute.page,
          children: [
            AutoRoute(
                path: RoutePaths.dashboard,
                page: DashboardRoute.page,
                initial: true),
            AutoRoute(path: RoutePaths.tasks, page: TasksRoute.page),
            AutoRoute(
              path: RoutePaths.empty,
              page: EmptyRoute.page,
              children: [
                AutoRoute(page: SettingsRoute.page, initial: true),
                CustomRoute(
                  page: ProfileRoute.page,
                  transitionsBuilder: TransitionsBuilders.zoomIn,
                  fullscreenDialog: true,
                ),
              ],
            ),
          ],
        ),
        AutoRoute(
          path: RoutePaths.controls,
          page: ControlsRoute.page,
        ),
        RedirectRoute(path: '*', redirectTo: '/'),
      ];

// extend the generated private router
}
