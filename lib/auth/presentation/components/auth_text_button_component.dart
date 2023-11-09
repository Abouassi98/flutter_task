import 'package:flutter/material.dart';

import '../../../core/core_features/theme/presentation/utils/custom_colors.dart';
import '../../../core/presentation/styles/styles.dart';

class AuthTextButtonComponent extends StatelessWidget {
  const AuthTextButtonComponent({
    required this.title,
    required this.tappableText,
    required this.onPressed,
    super.key,
  });

  final String title;
  final String tappableText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Text(
            tappableText,
            style: TextStyles.f18(context).copyWith(
              color: customColors(context).font20Color,
              fontWeight: FontStyles.fontWeightBold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(
          width: Sizes.paddingV14,
        ),
        Text(
          title,
          style: TextStyles.f18(context),
        ),
      ],
    );
  }
}
