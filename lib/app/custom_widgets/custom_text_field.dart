import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final String? label;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isObscure;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final InputBorder? border;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding; // Add contentPadding property

  const CustomTextFormField({
    super.key,
    this.controller,
    this.onTap,
    this.onChanged,
    this.validator,
    this.hintText,
    this.labelText,
    this.label,
    this.suffixIcon,
    this.isObscure,
    this.textCapitalization = TextCapitalization.sentences,
    this.inputFormatter,
    this.textInputAction,
    this.errorText,
    this.maxLines,
    this.keyboardType,
    this.prefixIcon,
    this.border, this.focusNode, this.contentPadding,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label ?? '',
          ),
        TextFormField(
          style: TextStyle(color: Colors.white,fontSize: 17),
          controller: widget.controller,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: widget.isObscure ?? false,
          textCapitalization: widget.textCapitalization,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.inputFormatter,
          maxLines: widget.maxLines,
          keyboardType: widget.keyboardType,
          focusNode: widget.focusNode,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor:Colors.red.shade400.withOpacity(0.8),
            hintText: widget.hintText,
            labelText: widget.labelText,
            errorText: widget.errorText,
            errorStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(color: Colors.grey,fontSize: 12),
            labelStyle: TextStyle(),
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            suffixStyle: TextStyle(color: Colors.white),
            contentPadding: widget.contentPadding,
            suffixIconConstraints: BoxConstraints(
              maxHeight: 34,
              maxWidth: 60,
              minHeight: 18,
              minWidth: 20,
            ),
            suffixIconColor: Colors.black,
            border: widget.border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide.none
                ),
          ),
        ),
      ],
    );
  }
}
