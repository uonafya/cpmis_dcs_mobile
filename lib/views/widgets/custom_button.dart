import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.text,
      this.onTap,
      this.child,
      this.textColor = Colors.black,
      this.borderRadius = 8,
      this.color,
      this.borderColor,
      this.height,
      this.isLoading = false,
      this.isDisabled = false})
      : assert(text != null || child != null);

  final String? text;
  final Widget? child;
  final Function? onTap;
  final Color? color;
  final Color? textColor;
  final bool isLoading;
  final double borderRadius;
  final double? height;
  final Color? borderColor;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null && !isLoading && !isDisabled) {
          onTap!();
        }
      },
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          height: height ?? 46,
          decoration: BoxDecoration(
            color: isDisabled ? Colors.grey[400]! : color ?? kPrimaryColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: borderColor != null
                ? Border.all(color: borderColor!, width: 1)
                : null,
          ),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : child ??
                    Text(
                      text!,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: textColor,
                        fontSize: 14,
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}
