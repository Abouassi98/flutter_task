import 'package:flutter/material.dart';

import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/responsive_widgets/responsive_layouts.dart';
import '../../../domain/register_user_parms.dart';
import '../../providers/register_provider.dart';
import 'register_screen_compact.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.easyListen(
      registerStateProvider,
      whenData: (email) {
        if (email is Some<RegisterUserParms>) {
          //     const VerifyEmailRoute().go(context);
        }
      },
    );

    return WindowClassLayout(
      compact: (_) => OrientationLayout(
        portrait: (_) => const RegisterScreenCompact(),
      ),
    );
  }
}
