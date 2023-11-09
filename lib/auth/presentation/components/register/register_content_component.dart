import '../../../../core/presentation/routing/navigation_service.dart';
import '../auth_text_button_component.dart';
import 'register_form_component.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/styles/styles.dart';

class RegisterContentComponent extends StatelessWidget {
  const RegisterContentComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: Sizes.maxWidth360,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'حساب جديد',
            style: TextStyles.f20(context),
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          Text(
            'مرحبا بك ، قم بملأ البيانات للتسجيل',
            style: TextStyles.f14(context),
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          const RegisterFormComponent(),
          const SizedBox(
            height: Sizes.marginV28,
          ),
          AuthTextButtonComponent(
            title: 'لديك حساب ؟',
            tappableText: 'الدخول',
            onPressed: () {
              NavigationService.pop<void>(context);
            },
          ),
        ],
      ),
    );
  }
}
