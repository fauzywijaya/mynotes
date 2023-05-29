import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/common_widget/common_widget.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/features/domain.dart';
import 'package:notes/src/features/presentation.dart';
import 'package:notes/src/shared/helper/helper.dart';

class HomeListWidget extends ConsumerStatefulWidget {
  const HomeListWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeListWidgetState();
}

class _HomeListWidgetState extends ConsumerState<HomeListWidget> {
  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero, () {
      ref.read(homeListControllerProvider.notifier).getHomeList();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<HomeList> homes = ref.watch(homeListControllerProvider);
    return AsyncValueWidget<HomeList>(
      value: homes,
      data: (value) {
        if (value.data.isEmpty) {
          return const LoadingWidget();
        }
        return ListView.builder(
          itemCount: value.data.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final homelist = value.data[index];
            return Dismissible(
              key: Key(homelist.id.toString()),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 16.0),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                // Hapus data dari list saat dihapus dengan menggeser
                value.data.removeAt(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${homelist.firstName} dihapus')),
                );
              },
              child: ListTile(
                title: Text(homelist.firstName),
                subtitle: Text(homelist.lastName),
                trailing: CircleAvatar(
                    backgroundColor: ColorApp.darkGrey,
                    child: CachedNetworkImage(imageUrl: homelist.avatar)),
                onLongPress: () {
                  showRegularBottomSheet(
                    context,
                    child: const AddPage(),
                  );
                },
              ),
            );
          },
        );
        // // Padding(
        // //   padding: EdgeInsets.only(bottom: SizeApp.h20),
        //   child:
        // // );
      },
    );
  }
}
