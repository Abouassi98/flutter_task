import 'package:flutter/material.dart';

import '../../../../core/presentation/routing/app_router.dart';
import '../../../../core/presentation/styles/styles.dart';

import '../auth_text_button_component.dart';

import 'login_form_component.dart';

class LoginContentComponent extends StatelessWidget {
  const LoginContentComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: Sizes.maxWidth360,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: Sizes.marginV28,
          ),
          Text(
            'تسجيل الدخول',
            style: TextStyles.f20(context),
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          Text(
            'من فضلك قم بالدخول لإتمام الشراء',
            style: TextStyles.f14(context),
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          const LoginFormComponent(),
          const SizedBox(
            height: Sizes.marginV28,
          ),
          AuthTextButtonComponent(
            title: 'ليس لديك حساب ؟',
            tappableText: 'التسجيل',
            onPressed: () {
              const RegisterRoute().go(context);
            },
          ),
          const SizedBox(
            height: Sizes.marginV28,
          ),
        ],
      ),
    );
  }
}
