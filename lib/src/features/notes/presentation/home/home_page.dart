import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/features/presentation.dart';
import 'package:notes/src/routes/routes.dart';
import 'package:notes/src/shared/helper/helper.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(homeControllerProvider.notifier);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorApp.darkerGrey,
          elevation: 1,
          title: const Text('Home Page'),
          actions: [
            IconButton(
              onPressed: () {
                controller.logout();
                context.goNamed(Routes.login.name);
              },
              icon: const Icon(Icons.logout_rounded),
            ),
          ],
        ),
        body: const SingleChildScrollView(child: HomeListWidget()),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorApp.lightBlue,
          onPressed: () {
            showRegularBottomSheet(
              context,
              child: const AddPage(),
            );
          },
          child: const Icon(
            Icons.add,
            color: ColorApp.white,
          ),
        ));
  }
}
