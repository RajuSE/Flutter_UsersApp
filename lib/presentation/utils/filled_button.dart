import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_colors.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final EdgeInsets padding;
  final VoidCallback onTap;
  final TextStyle textStyle;
  final Color color;
  final Color disableColor;
  final bool isExpanded;
  final bool showBorder;
  final double radius;
  final String? image;
  final IconData? icon;

  const CustomFilledButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color = AppColors.primaryBlue,
    this.isActive = true,
    this.padding = const EdgeInsets.all(18.0),
    this.textStyle = const TextStyle(fontSize: 20),
    this.disableColor = AppColors.disableButtonColor,
    this.isExpanded = true,
    this.showBorder = false,
    this.radius = 20,
    this.image,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: showBorder
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 1,
                color: AppColors.primaryBlue,
              ),
            )
          : BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: MaterialButton(
        elevation: 0.0,
        minWidth: isExpanded ? double.infinity : null,
        onPressed: isActive ? onTap : null,
        // onPressed: onTap,
        // color: color,
        color: isActive ? color : AppColors.disableButtonColor,
        disabledColor: disableColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        padding: padding,
        child: image != null || icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Icon(
                      icon!,
                      size: 21,
                      color: Colors.white,
                    )
                  else
                    image!.endsWith('.svg')
                        ? SvgPicture.asset(
                            image!,
                            width: 20,
                            height: 20,
                            color: Colors.white,
                          )
                        : Image.asset(
                            image!,
                            width: 20,
                            height: 20,
                          ),
                  const SizedBox(width: 6),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ],
              )
            : Text(
                text,
                textAlign: TextAlign.center,
                style: textStyle,
              ),
      ),
    );
  }
}
