import 'package:flutter/material.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/custom_elevated_button.dart';
import '../../../../core/presentation/widgets/platform_widgets/platform_icons.dart';
import '../../../domain/register_user_parms.dart';
import '../../../domain/value_objects.dart';
import '../../providers/register_provider.dart';

class RegisterFormComponent extends HookConsumerWidget {
  const RegisterFormComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerFormKey = useMemoized(GlobalKey<FormState>.new);
    final usernameController = useTextEditingController(text: '');
    final firstnameController = useTextEditingController(text: '');
    final lastnameController = useTextEditingController(text: '');
    final emailController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');
    final confirmPasswordController = useTextEditingController(text: '');

    void register() {
      if (registerFormKey.currentState!.validate()) {
        final params = RegisterUserParms(
          email: emailController.text,
          password: Password(value: passwordController.text),
          firstName: firstnameController.text,
          lastName: lastnameController.text,
          username: UserName(value: usernameController.text),
        );
        ref.read(registerStateProvider.notifier).register(params);
      }
    }

    return Form(
      key: registerFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: Sizes.marginV12,
          ),
          Text(
            'اسم المستخدم',
            style: TextStyles.f14(context),
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          TextFormField(
            key: const ValueKey('register_username'),
            controller: usernameController,
            validator: RegisterUserParms.validateUsername(context),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          Text(
            'البريد الالكتروني',
            style: TextStyles.f14(context),
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          TextFormField(
            key: const ValueKey('register_email'),
            controller: emailController,
            validator: RegisterUserParms.validateEmail(context),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          Text(
            'االاسم الأول',
            style: TextStyles.f14(context),
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          TextFormField(
            key: const ValueKey('register_first_name'),
            controller: firstnameController,
            validator: RegisterUserParms.validateSingleName(context),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          Text(
            'الاسم الأخير',
            style: TextStyles.f14(context),
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          TextFormField(
            key: const ValueKey('register_last_name'),
            controller: lastnameController,
            validator: RegisterUserParms.validateSingleName(context),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
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
                key: const ValueKey('register_password'),
                controller: passwordController,
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
                validator: Password.validateCreatePassword(context),
                textInputAction: TextInputAction.next,
                obscureText: isObscure.value,
              );
            },
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          Text(
            'تأكيد كلمة السر',
            style: TextStyles.f14(context),
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          HookBuilder(
            builder: (context) {
              final isObscure = useState(true);
              return TextFormField(
                key: const ValueKey('register_confirm_password'),
                controller: confirmPasswordController,
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
                validator: (value) {
                  return Password.validateConfirmPassword(
                    context,
                    passwordController.text,
                    value,
                  );
                },
                textInputAction: TextInputAction.done,
                obscureText: isObscure.value,
              );
            },
          ),
          const SizedBox(
            height: Sizes.marginV28,
          ),
          CustomElevatedButton(
            onPressed: ref.isLoading(registerStateProvider) ? null : register,
            child: Text(
              'التسجيل',
              style: TextStyles.coloredElevatedButton(context),
            ),
          ),
        ],
      ),
    );
  }
}
