import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/app_color.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    required this.textInputType,
    required this.controller,
    required this.hintText,
    super.key,
    this.contentPadding,
    this.filled,
    this.validator,
    this.labelText,
    this.onChanged,
    this.maxLines,
    this.inputFormatter,
    this.labelColor,
    this.onSaved,
    this.obSecureText,
    this.onSubmitted,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconColor,
    this.prefixIconColor,
    this.hintStyle,
    this.labelStyle,
    this.style,
    this.autoFocus,
    this.focusNode,
    this.fillColor,
  });

  final TextInputType textInputType;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final Function(String)? onSubmitted;
  final TextInputFormatter? inputFormatter;
  final Color? labelColor;
  final int? maxLines;
  final Function(String?)? onSaved;
  Function(String)? onChanged;
  TextStyle? style;
  TextStyle? labelStyle;
  TextStyle? hintStyle;
  Color? suffixIconColor;
  Color? prefixIconColor;
  Color? fillColor;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool? filled;
  bool? obSecureText;
  bool? autoFocus;
  FocusNode? focusNode;
  EdgeInsetsGeometry? contentPadding;
  String? labelText;

  @override
  State<CustomTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderOnForeground: false,
      borderRadius: BorderRadius.circular(25),
      child: TextFormField(
        key: widget.key,
        validator: widget.validator,
        keyboardType: widget.textInputType,

        autocorrect: false,
        controller: widget.controller,
        onEditingComplete: () {
          if (widget.focusNode != null) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).unfocus();
          }
        },
        focusNode: widget.focusNode,
        textDirection: TextDirection.ltr,
        onFieldSubmitted: (value) {
          widget.onSubmitted != null?(value):null;
        },
        textInputAction: TextInputAction.done,
        maxLines: widget.maxLines ?? 1,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        autofocus: widget.autoFocus ?? false,
        obscureText: widget.obSecureText ?? false,
        obscuringCharacter: '*',
        style: widget.style,
        decoration: InputDecoration(
          counterStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
          // border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(12),
          //     borderSide: const BorderSide(
          //       width: 0.5,
          //     )
          //   borderSide: BorderSide.none,
          // ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: AppColors.redColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
              color: AppColors.backgroundGrey.withOpacity(0.2),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
              color: AppColors.backgroundGrey.withOpacity(0.2),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
              color: AppColors.backgroundGrey.withOpacity(0.2),
            ),
          ),
          suffixIcon: widget.suffixIcon,
          suffixIconColor: widget.suffixIconColor,
          prefixIconColor: widget.prefixIconColor,
          prefixIcon: widget.prefixIcon,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ??
              Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyColor,
                  ),
          labelText: widget.labelText,
          labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: widget.labelColor ?? AppColors.greyColor,
              ),
          fillColor: widget.fillColor ?? AppColors.backgroundGrey,
          filled: true ?? widget.filled,
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
        enabled: true,
      ),
    );
  }
}
