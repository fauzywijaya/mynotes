import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/features/presentation.dart';
import 'package:notes/src/routes/routes.dart';
import 'package:notes/src/shared/helper/helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorApp.black,
          title: const Text('Home Page'),
          actions: [
            IconButton(
              onPressed: () {
                context.goNamed(Routes.login.name);
              },
              icon: const Icon(Icons.logout_rounded),
            ),
          ],
        ),
        body: const SafeArea(
            child: Center(
          child: Text('Home Page'),
        )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorApp.red,
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
