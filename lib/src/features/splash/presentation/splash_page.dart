import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/src/routes/routes.dart';
import 'package:notes/src/services/local/hive_service.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      if (ref.read(hiveServiceProvider).getUser() != null) {
        context.goNamed(Routes.home.name);
        return;
      }
      context.goNamed(Routes.login.name);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.notes_rounded,
          size: 80,
        ),
      ),
    );
  }
}
