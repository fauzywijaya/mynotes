import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/features/presentation.dart';
import 'package:notes/src/routes/routes.dart';

enum Routes {
  splash,
  login,
  register,
  home,
  detail,
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      urlPathStrategy: UrlPathStrategy.path,
      initialLocation: '/login',
      routerNeglect: true,
      routes: [
        // GoRoute(
        //   path: '/',
        //   name: Routes.splash.name,
        //   builder: (context, state) => const SplashPage(),
        // ),
        GoRoute(
          path: '/home',
          name: Routes.home.name,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: "/login",
          name: Routes.login.name,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: "/register",
          name: Routes.register.name,
          builder: (context, state) => const RegisterPage(),
        )
      ],
      errorBuilder: (context, state) => ErrorPage(
        error: state.error,
      ),
    );
  },
);
