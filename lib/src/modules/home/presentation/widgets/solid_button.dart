import 'package:flutter/material.dart';
import 'package:portfolio/generated/colors.gen.dart';

class SolidButton extends StatelessWidget {
  const SolidButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height = 56,
    this.radius = 8,
    this.isEnable = true,
    this.width = double.infinity,
    this.foregroundColor = Colors.white,
    this.backgroundColor = Colors.deepOrangeAccent,
  }) : super(key: key);

  final String text;
  final double radius;
  final bool isEnable;
  final double height;
  final double width;
  final Color backgroundColor;
  final Color foregroundColor;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Opacity(
        opacity: isEnable ? 1 : 0.5,
        child: ElevatedButton(
            onPressed: isEnable ? onPressed : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              padding: EdgeInsets.zero,
              disabledForegroundColor: Colors.grey.shade300,
              alignment: Alignment.center,
              textStyle: _createTextStyle(context),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            child: Text(text)),
      ),
    );
  }

  TextStyle? _createTextStyle(BuildContext context) {
    var style = Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w400
        );
    return style;
  }
}
