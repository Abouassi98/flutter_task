import 'package:flutter/material.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/custom_elevated_button.dart';
import '../../../../core/presentation/widgets/platform_widgets/platform_icons.dart';
import '../../../domain/sign_in_with_user_name.dart';
import '../../../domain/value_objects.dart';
import '../../providers/sign_in_provider.dart';

class LoginFormComponent extends HookConsumerWidget {
  const LoginFormComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginFormKey = useMemoized(GlobalKey<FormState>.new);
    final emailController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');

    void signIn() {
      if (loginFormKey.currentState!.validate()) {
        final params = SignInWithUserNameParms(
          userName: UserName(value: emailController.text),
          password: Password(value: passwordController.text),
        );
        ref.read(signInStateProvider.notifier).signIn(params);
      }
    }

    return Form(
      key: loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'اسم المستخدم',
            style: TextStyles.f14(context),
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          TextFormField(
            key: const ValueKey('login_user_name'),
            controller: emailController,
            style: TextStyles.f14TextFormField(context),
            validator: UserName.validatevalidateUsername(context),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          Text(
            'كلمة السر',
            style: TextStyles.f14(context),
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          HookBuilder(
            builder: (context) {
              final isObscure = useState(true);
              return TextFormField(
                key: const ValueKey('login_password'),
                controller: passwordController,
                style: TextStyles.f14TextFormField(context),
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: Theme.of(context)
                              .inputDecorationTheme
                              .contentPadding!
                              .horizontal /
                          2,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        isObscure.value = !isObscure.value;
                      },
                      child: isObscure.value
                          ? Icon(
                              AppPlatformIcons.platformIcons(context)
                                  .eyeSlashSolid,
                              color: Theme.of(context)
                                  .inputDecorationTheme
                                  .suffixIconColor,
                              size: Sizes.icon24,
                            )
                          : Icon(
                              AppPlatformIcons.platformIcons(context).eyeSolid,
                              color: Theme.of(context)
                                  .inputDecorationTheme
                                  .suffixIconColor,
                              size: Sizes.icon24,
                            ),
                    ),
                  ),
                  suffixIconConstraints: const BoxConstraints(),
                ),
                validator: Password.validateLoginPassword(context),
                textInputAction: TextInputAction.go,
                obscureText: isObscure.value,
              );
            },
          ),
          const SizedBox(
            height: Sizes.marginV28,
          ),
          CustomElevatedButton(
            onPressed: ref.isLoading(signInStateProvider) ? null : signIn,
            child: Text(
              'الدخول',
              style: TextStyles.coloredElevatedButton(context),
            ),
          ),
        ],
      ),
    );
  }
}
