import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/src/common_widget/common_widget.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/shared/extensions/extensions.dart';

enum ButtonType {
  primary,
  outlined,
}

class ButtonWidget extends StatelessWidget {
  final ButtonType buttonType;
  final Function()? onTap;
  final String text;
  final bool isLoading;
  final bool _isEnabled;
  final Widget? prefix;

  const ButtonWidget({
    super.key,
    required this.buttonType,
    this.onTap,
    required this.text,
    this.prefix,
    this.isLoading = false,
    bool? isEnabled,
  }) : _isEnabled = isEnabled ?? onTap != null;

  const ButtonWidget.primary({
    Key? key,
    this.onTap,
    required this.text,
    this.isLoading = false,
    this.prefix,
    bool? isEnabled,
  })  : buttonType = ButtonType.primary,
        _isEnabled = isEnabled ?? onTap != null,
        super(key: key);

  const ButtonWidget.outlined({
    Key? key,
    this.onTap,
    required this.text,
    this.isLoading = false,
    this.prefix,
    bool? isEnabled,
  })  : buttonType = ButtonType.outlined,
        _isEnabled = isEnabled ?? onTap != null,
        super(key: key);

  Color getColor() => _isEnabled
      ? buttonType == ButtonType.primary
          ? ColorApp.lightBlue
          : ColorApp.darkGrey
      : ColorApp.grey;

  Color getFocusColor() =>
      buttonType == ButtonType.primary ? ColorApp.lightBlue : ColorApp.darkGrey;

  bool get isPrimary => buttonType == ButtonType.primary;
  bool get isOutlined => buttonType == ButtonType.outlined;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: getColor(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: isOutlined
            ? const BorderSide(color: ColorApp.white, width: 0.4)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: _isEnabled && !isLoading ? onTap : null,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        overlayColor: MaterialStateProperty.all(getFocusColor()),
        focusColor: getFocusColor(),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeApp.w28,
            vertical: SizeApp.h16,
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: SizeApp.customHeight(22),
                    width: SizeApp.customWidth(22),
                    child: const LoadingWidget(),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (prefix != null) ...[
                        prefix!,
                        Gap.w8,
                      ],
                      Text(
                        text,
                        style: _isEnabled
                            ? TypographyApp.headline3
                            : TypographyApp.headline3.white,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
