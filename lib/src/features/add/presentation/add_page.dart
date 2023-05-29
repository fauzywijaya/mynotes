import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/src/common_widget/common_widget.dart';
import 'package:notes/src/common_widget/input_form/my_text_field.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/exceptions/network_exceptions.dart';
import 'package:notes/src/features/add/presentation/add_controller.dart';
import 'package:notes/src/shared/extensions/extensions.dart';

class AddPage extends ConsumerWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValueAdd = ref.watch(addControllerProvider);
    return Material(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.all(20),
          color: ColorApp.darkGrey,
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BottomSheetHolder(),
                Gap.h20,
                Text(
                  'Add Review',
                  style: TypographyApp.headline3,
                  textAlign: TextAlign.start,
                ),
                Gap.h20,
                const MyTextField(
                  labelText: "Description",
                ),
                Gap.h20,
                const MyTextField(
                  labelText: "Title",
                ),
                // LabelTextField(
                //   hintText: 'Input your title here...',
                //   labelText: 'Title',
                //   onChanged: ((value) {
                //     ref.read(addControllerProvider.notifier).titleChange(value);
                //   }),
                // ),
                Gap.h20,
                // LabelTextField(
                //   hintText: 'Input your Description here...',
                //   labelText: 'Description',
                //   maxLines: 4,
                //   onChanged: ((value) {
                //     ref
                //         .read(addControllerProvider.notifier)
                //         .descriptionChange(value);
                //   }),
                // ),
                Gap.h40,
                RegularButton(
                  text: 'Submit',
                  isLoading: asyncValueAdd.isLoading,
                  onPressed: () {
                    ref.read(addControllerProvider.notifier).postReview();
                  },
                ),
                Gap.h20,
                asyncValueAdd.maybeWhen(
                  error: (error, stacktrace) => Text(
                    'Failed Add Review!: ${NetworkExceptions.getErrorMessage(error as NetworkExceptions)}',
                    style: TypographyApp.text1.red,
                  ),
                  orElse: () => Container(),
                ),
                Gap.h20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LabelField extends StatelessWidget {
  final String labelText;

  const LabelField(this.labelText, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(labelText, style: TypographyApp.text1),
        Gap.h8,
        TextField(
          decoration: InputDecoration(
            fillColor: ColorApp.lightGrey,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.solid,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
                horizontal: SizeApp.w16, vertical: SizeApp.h12),
            hintText: 'Input your title here...',
            hintStyle: TypographyApp.text2.grey,
          ),
          onChanged: (value) {},
          maxLines: 1,
        ),
      ],
    );
  }
}
