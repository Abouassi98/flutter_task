import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import '../../../../gen/my_assets.dart';
import '../../providers/device_info_providers.dart';
import '../../styles/styles.dart';
import '../../utils/riverpod_framework.dart';
import '../full_screen_scaffold.dart';
import 'splash_screen.dart';

class SplashScreenCompact extends StatelessWidget {
  const SplashScreenCompact({super.key});

  @override
  Widget build(BuildContext context) {
    return const FullScreenScaffold(
      setOlderAndroidImmersiveMode: SplashScreen.setOlderAndroidImmersiveMode,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.screenPaddingH16),
        child: Center(
          child: _SplashScreenLogo(),
        ),
      ),
    );
  }
}

class _SplashScreenLogo extends ConsumerWidget {
  const _SplashScreenLogo();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAndroid12AndHigher =
        ref.watch(androidDeviceInfoProvider).isAndroid12AndHigher;
    return isAndroid12AndHigher
        ? Image.asset(
            MyAssets.ASSETS_IMAGES_CORE_ANDROID12SPLASH_PNG,
            fit: BoxFit.cover,
          )
        : SvgPicture.asset(
            MyAssets.ASSETS_IMAGES_CORE_CUSTOM_SPLASH_ICON_SVG,
            width: 300,
            fit: BoxFit.cover,
          );
  }
}
