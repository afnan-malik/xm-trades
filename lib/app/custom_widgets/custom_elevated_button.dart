
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String? text;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final TextStyle? buttonTextStyle;
  final double? radius;
  final double? height;
  final double? width;
  final IconData? trailingIcon;

  CustomElevatedButton({
    super.key,
    this.onPressed,
    this.text,
    this.padding,
    this.backgroundColor,
    this.buttonTextStyle,
    this.radius,
    this.height,
    this.width,
    this.foregroundColor,
    this.trailingIcon,
  });

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: widget.padding,
          backgroundColor: widget.backgroundColor ?? Colors.black26,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? 100),
          ),
        ),
        onPressed: widget.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text ?? '',
              style: widget.buttonTextStyle ?? null,
            ),
            if (widget.trailingIcon != null)
              SizedBox(
                height: 40,
                width: 20,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
