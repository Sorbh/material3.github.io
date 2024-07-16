import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material3_color_scheme/presentation/color_role/color_role_screen.dart';
import 'package:material3_color_scheme/presentation/home/home_screen.dart';

class AppRouter {
  static final goRouter = GoRouter(
    initialLocation: _AppRoute.homePage.path,
    routes: [
      GoRoute(
        path: _AppRoute.homePage.path,
        name: _AppRoute.homePage.name,
        builder: (context, state) => const HomeScreen(
          title: 'Color Scheme for Material 3',
        ),
        routes: [
          GoRoute(
            path: _AppRoute.colorRolePage.path,
            name: _AppRoute.colorRolePage.name,
            builder: (context, state) => ColorRoleScreen(
              color: state.pathParameters['name']!,
            ),
          )
        ],
      ),
    ],
    debugLogDiagnostics: kDebugMode,
  );

  static void pop(BuildContext context) {
    GoRouter.of(context).pop();
  }

  static void gotoColorRoleScreen(BuildContext context, String color) {
    GoRouter.of(context).goNamed(_AppRoute.colorRolePage.name, pathParameters: {'name': color});
  }
}

enum _AppRoute {
  homePage('home', '/home'),
  colorRolePage('color-role', 'color-role/:name');

  final String name;
  final String path;
  const _AppRoute(this.name, this.path);
}
