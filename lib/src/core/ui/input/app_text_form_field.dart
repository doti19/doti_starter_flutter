import 'package:doti_starter/src/core/generated/colors.gen.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.textInputAction,
    required this.decoration,
    required this.keyboardType,
    required this.onChanged,
    required this.validator,
    super.key,
    this.controller,
    this.obscureText,
    this.suffixIcon,
    this.onEditingComplete,
    this.autofocus,
    this.focusNode,
  });

  final void Function(String) onChanged;
  final String? Function(String?) validator;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final bool? obscureText;
  final Widget? suffixIcon;
  final InputDecoration decoration;
  final bool? autofocus;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        focusNode: focusNode,
        onChanged: onChanged,
        autofocus: autofocus ?? false,
        validator: validator,
        obscureText: obscureText ?? false,
        obscuringCharacter: '*',
        onEditingComplete: onEditingComplete,
        decoration: decoration.copyWith(
          labelStyle: TextStyle(
            color: ColorName.learninactivecard,
          ),
          prefixIconColor: ColorName.learninactivecard,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorName.learninactivecard,
              width: 1.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorName.primary,
              width: 1.0,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorName.error,
              width: 1.0,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorName.error,
              width: 1.0,
            ),
          ),
        ),
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }
}
