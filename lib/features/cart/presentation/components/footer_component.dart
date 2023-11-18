import 'package:flutter/material.dart';
import '../../../../core/core_features/theme/presentation/utils/custom_colors.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/custom_elevated_button.dart';

class FooterComponent extends HookConsumerWidget {
  const FooterComponent({
    required this.totalPriceNotifier,
    super.key,
  });
  final ValueNotifier<double> totalPriceNotifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPrice = useValueListenable(totalPriceNotifier);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: Sizes.paddingH10,
          ),
          padding: const EdgeInsets.all(
            Sizes.paddingH10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Sizes.widgetRadius5,
            ), // Adjust the radius as needed
            color: customColors(context).whiteColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'الإجمالي',
                    style: TextStyles.blueBoldF14(context),
                  ),
                  Row(
                    children: [
                      Text(
                        totalPrice.toStringAsFixed(2),
                        style: TextStyles.blackMediumF14(context),
                      ),
                      const SizedBox(
                        width: Sizes.marginH6,
                      ),
                      Text(
                        'ج.م',
                        style: TextStyles.blackMediumF12(context),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: Sizes.marginV10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'الضرائب',
                    style: TextStyles.blueBoldF14(context),
                  ),
                  Row(
                    children: [
                      Text(
                        (totalPrice * 0.08).toStringAsFixed(2),
                        style: TextStyles.blackMediumF14(context),
                      ),
                      const SizedBox(
                        width: Sizes.marginH6,
                      ),
                      Text(
                        'ج.م',
                        style: TextStyles.blackMediumF12(context),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: Sizes.marginV10,
        ),
        CustomElevatedButton(
          onPressed: () {
            // Add your button action here
          },
          child: Text(
            'إتمام الشراء',
            style: TextStyles.whiteBoldF16(context),
          ),
        ),
      ],
    );
  }
}
