// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../core_features/theme/presentation/utils/app_static_colors.dart';
import '../styles/styles.dart';
import 'platform_widgets/platform_icons.dart';

class CustomRetryWidget extends StatelessWidget {
  const CustomRetryWidget({
    required this.onPressed,
    this.height,
    this.width,
    this.child,
    this.borderRadius,
    this.boxShadow,
    super.key,
  });

  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AbsorbPointer(
        child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: AppStaticColors.placeHolderBaseColor,
            borderRadius: borderRadius,
            boxShadow: boxShadow,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                AppPlatformIcons.restart,
                size: Sizes.icon24,
                color: AppStaticColors.placeHolderHighlightColor,
              ),
              if (child != null) Opacity(opacity: 0, child: child),
            ],
          ),
        ),
      ),
    );
  }
}
