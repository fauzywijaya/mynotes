import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/features/presentation.dart';
import 'package:notes/src/routes/routes.dart';
import 'package:notes/src/services/services.dart';

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
      redirect: (state) {
        // if the user is not logged in, they need to login
        final loggedIn = ref.read(hiveServiceProvider).getUser() != null;
        final loggingIn = state.subloc == '/login';
        if (!loggedIn) return loggingIn ? null : '/login';

        // if the user is logged in but still on the login page, send them to
        // the home page
        if (loggingIn) return '/home';

        // no need to redirect at all
        return null;
      },
      redirectLimit: 1,
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
          path: '/login',
          name: Routes.login.name,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/register',
          name: Routes.register.name,
          builder: (context, state) => const RegisterPage(),
        ),
      ],
      errorBuilder: (context, state) => ErrorPage(
        error: state.error,
      ),
    );
  },
);
