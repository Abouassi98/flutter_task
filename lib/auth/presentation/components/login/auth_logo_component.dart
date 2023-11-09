import 'package:flutter/material.dart';
import '../../../../gen/my_assets.dart';

class AuthLogoComponent extends StatelessWidget {
  const AuthLogoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      MyAssets.ASSETS_IMAGES_CORE_LOGIN_PNG,
      width: 128,
      fit: BoxFit.cover,
    );
  }
}
