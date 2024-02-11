import 'package:flutter/material.dart';
import 'package:flutter_assessment/utils/constants.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    this.hintText,
    required this.controller,
    this.isLargeTextfield = false,
    this.isPassword = false,
    this.keyboardType,
    this.isSpacing = true,
    this.error = '',
    this.onTap,
    this.icon,
    this.hintcolor,
    this.suffixIcon,
    this.padding,
    this.fillcolor,
    this.border,
    this.radius,
    this.hintStyle,
    this.borderColor,
    this.onChanged,
  });
  final String? hintText;
  final bool isLargeTextfield;
  final TextEditingController controller;
  final bool isPassword;
  final String error;
  final bool isSpacing;
  final VoidCallback? onTap;
  Function(String s)? onChanged;
  final TextInputType? keyboardType;
  final Widget? icon;
  final Widget? suffixIcon;
  final Color? hintcolor;
  final Color? fillcolor;
  final Color? borderColor;
  final bool? border;
  final double? radius;
 final TextStyle? hintStyle;
  final EdgeInsets? padding;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.radius ?? 8),
            ),
            margin: const EdgeInsets.only(
              bottom: 20,
            ),
            child: TextField(
              enabled: widget.onTap != null ? false : true,
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              obscureText: widget.isPassword ? isObscure : false,
              maxLines: widget.isLargeTextfield ? 5 : 1,
              style:  const TextStyle(
                    color: Color(0XFF111827),
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                isCollapsed: true,
                prefixIcon: widget.icon,
                suffixIcon: widget.suffixIcon,
                fillColor: widget.fillcolor ?? Colors.white,
                filled: true,
                contentPadding: widget.padding ??
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                hintText: widget.hintText,
                hintStyle: widget.hintStyle ??
                    TextStyle(
                          color: widget.hintcolor ??
                              const Color.fromARGB(255, 110, 110, 110),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    
                disabledBorder: widget.border != null
                    ? OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.radius ?? 11),
                        borderSide: BorderSide(
                            width: 0.9,
                            color: widget.borderColor ?? Colors.transparent))
                    : OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.radius ?? 11),
                        borderSide:
                            const BorderSide(width: 0.9, color: Colors.grey)),
                enabledBorder: widget.border != null
                    ? OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.radius ?? 11),
                        borderSide: BorderSide(
                            width: 0.9,
                            color: widget.borderColor ?? Colors.transparent))
                    : OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.radius ?? 11),
                        borderSide:
                            const BorderSide(width: 0.9, color: Colors.grey)),
                focusedBorder: widget.border != null
                    ? OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.radius ?? 11),
                        borderSide: const BorderSide(
                            width: 0.9, color: Colors.transparent))
                    : OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.radius ?? 11),
                        borderSide: BorderSide(width: 0.9, color: AppConstants.backgroundColor)),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: widget.error == ''
              ? const SizedBox()
              : FadeIn(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4,bottom: 4),
                    child: Text(
                      widget.error,
                      style: const TextStyle(
                            color:
                                Color.fromARGB(255, 232, 26, 26),
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
