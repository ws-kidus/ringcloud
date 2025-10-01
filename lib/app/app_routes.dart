import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ringcloud/app/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:ringcloud/app/features/dashboard/presentation/ui/dashboard.dart';
import 'package:ringcloud/app/features/dashboard/presentation/ui/pages/call_log_page.dart';
import 'package:ringcloud/app/features/dashboard/presentation/ui/pages/contacts_page.dart';
import 'package:ringcloud/app/features/dashboard/presentation/ui/pages/dialler_page.dart';
import 'package:ringcloud/app/features/dashboard/presentation/ui/pages/favorite_page.dart';
import 'package:ringcloud/app/features/dashboard/presentation/ui/pages/settings_page.dart';
import 'package:ringcloud/app/not_found_screen.dart';

class AppRoutes {
  static GoRouter get routerConfig =>
      GoRouter(
        errorBuilder: (context, state) => NotFoundScreen(),
        routes: [

          ///Auth
          StatefulShellRoute.indexedStack(
            builder:
                (context, goRouterState, navigationShell) =>
                MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => DashboardBloc(),
                    ),
                  ],
                  child: Dashboard(
                    navigationShell: navigationShell,
                    location: goRouterState.uri.toString(),
                  ),
                ),
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    name: FavoritePage.routeName,
                    path: "/favorite",
                    builder: (context, state) => FavoritePage(),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    name: CallLogPage.routeName,
                    path: "/call-log",
                    builder: (context, state) => CallLogPage(),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    name: DiallerPage.routeName,
                    path: "/",
                    builder: (context, state) => DiallerPage(),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    name: ContactsPage.routeName,
                    path: "/contacts",
                    builder: (context, state) => ContactsPage(),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    name: SettingsPage.routeName,
                    path: "/settings",
                    builder: (context, state) => SettingsPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
}
