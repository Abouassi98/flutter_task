import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/presentation/routing/navigation_service.dart';
import '../../../core/presentation/styles/styles.dart';
import '../../../gen/my_assets.dart';

class AuthBackButton extends StatelessWidget {
  const AuthBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: GestureDetector(
        onTap: () {
          NavigationService.pop<void>(context);
        },
        child: SvgPicture.asset(
          MyAssets.ASSETS_ICONS_BACK_BUTTON_SVG,
          width: Sizes.icon24,
          height: Sizes.icon24,
        ),
      ),
    );
  }
}
