import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/common_widget/common_widget.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/features/presentation.dart';
import 'package:notes/src/shared/extensions/extensions.dart';
import 'package:notes/src/shared/helper/helper.dart';

class HomeListWidget extends ConsumerStatefulWidget {
  const HomeListWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeListWidgetState();
}

class _HomeListWidgetState extends ConsumerState<HomeListWidget> {
  HomeController get controller => ref.read(homeControllerProvider.notifier);
  HomeState get state => ref.watch(homeControllerProvider);

  @override
  void didChangeDependencies() {
    safeRebuild(() {
      controller.getNotesList();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (state.notesValue.hasError) {
        return const Center(
          child: Text("Error"),
        );
      } else if (state.isLoading) {
        return const Center(
          child: LoadingWidget(),
        );
      } else if (state.noteList!.notes!.isEmpty) {
        return Center(
          child: Text(
            'You haven\'t any notes, please add your note first',
            style: TypographyApp.headline2,
            textAlign: TextAlign.center,
          ),
        );
      }
      return ListView.builder(
        itemCount: state.noteList?.notes?.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final noteList = state.noteList?.notes?[index];
          return Dismissible(
            key: Key(noteList!.noteId.toString()),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 16.0),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              controller.deleteNote(noteId: noteList.noteId.toString());
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${noteList.title} dihapus')),
              );
            },
            child: ListTile(
              title: Text(noteList.title.toString()),
              subtitle: Text(noteList.desc.toString()),
              // trailing: CircleAvatar(
              //     backgroundColor: ColorApp.darkGrey,
              //     child: CachedNetworkImage(imageUrl: noteList.avatar)),
              onLongPress: () {
                showRegularBottomSheet(
                  context,
                  child: UpdatePage(
                    detailNote: noteList,
                  ),
                );
              },
            ),
          );
        },
      );
    });
    // return AsyncValueWidget(
    //   value: notes,
    //   loading: (value) {
    //     return const Center(
    //       child: LoadingWidget(),
    //     );
    //   },
    //   data: (value) {
    //     return
    //   },
    // );
  }
}
