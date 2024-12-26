import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String? text;
  final String? trailingImage;
  final IconData? trailingIcon;
  final bool isTrailingImage;
  final bool isTrailingIcon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final TextStyle? textStyle;

  const CustomTextButton({
    super.key,
    this.onPressed,
    this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.textStyle,
    this.trailingImage,
    this.isTrailingImage = false,
    this.isTrailingIcon = false,
    this.trailingIcon,
  });

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: widget.backgroundColor,
        foregroundColor: widget.foregroundColor,
        textStyle: widget.textStyle ?? null
      ),
      onPressed: widget.onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.text ?? ''),
        ],
      ),
    );
  }
}
