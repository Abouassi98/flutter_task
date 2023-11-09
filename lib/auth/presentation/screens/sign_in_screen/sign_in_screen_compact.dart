import 'package:flutter/material.dart';

import '../../../../core/presentation/screens/full_screen_scaffold.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../components/login/auth_logo_component.dart';
import '../../components/login/login_content_component.dart';

class SignInScreenCompact extends StatelessWidget {
  const SignInScreenCompact({super.key});

  @override
  Widget build(BuildContext context) {
    return const FullScreenScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: Sizes.screenPaddingV16,
            bottom: Sizes.screenPaddingV16,
            right: Sizes.screenPaddingH24,
            left: Sizes.screenPaddingH24,
          ),
          child: Column(
            children: [
              SizedBox(
                height: Sizes.marginV12 + Sizes.icon24,
              ),
              AuthLogoComponent(),
              SizedBox(
                height: Sizes.marginV28,
              ),
              LoginContentComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
