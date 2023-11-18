import 'package:flutter/material.dart';
import '../../../../core/core_features/theme/presentation/utils/custom_colors.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/custom_elevated_button.dart';
import '../../../../gen/my_assets.dart';

class CopounComponent extends HookConsumerWidget {
  const CopounComponent({
    super.key,
  });
  static InputBorder outlinedBorder(BuildContext context) => OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
          width: 2,
        ),
      );

  static InputBorder disabledBorder(BuildContext context) => OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(
          color: customColors(context).greyColor!.withOpacity(0.3),
          width: 2,
        ),
      );
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final copounController = useTextEditingController(text: '');
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            MyAssets.ASSETS_IMAGES_CORE_SLIDER_PNG,
          ),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.paddingV10,
              //   horizontal: Sizes.paddingH10,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: Sizes.paddingH20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'هل تمتلك كوبون للخصم ؟',
                    style: TextStyles.whiteBoldF16(context),
                  ),
                  const SizedBox(
                    height: Sizes.marginH20,
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: TextFormField(
                            key: const ValueKey('copoun'),
                            decoration: InputDecoration(
                              fillColor: Colors.white30,
                              hintText: 'أدخل رقم الكوبون',
                              enabledBorder: outlinedBorder(context),
                              focusedBorder: outlinedBorder(context),
                              disabledBorder: disabledBorder(context),
                            ),
                            controller: copounController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(
                          width: Sizes.paddingH10,
                        ),
                        // Adjust the space between buttons
                        SizedBox(
                          width: 120,
                          child: CustomElevatedButton(
                            padding: EdgeInsets.zero,
                            borderRadius: BorderRadius.circular(5),
                            buttonColor: Colors.white,
                            onPressed: () {
                              // Handle button 2 click
                            },
                            child: const Text(
                              'تطبيق',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
