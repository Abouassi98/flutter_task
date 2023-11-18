import 'package:flutter/material.dart';
import '../../../../core/core_features/theme/presentation/utils/custom_colors.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';

class TotalComponent extends HookConsumerWidget {
  const TotalComponent({
    required this.totalPriceNotifier,
    super.key,
  });
  final ValueNotifier<double> totalPriceNotifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPrice = useValueListenable(totalPriceNotifier);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.widgetRadius5,
        ), // Adjust the radius as needed
        color: customColors(context).whiteColor,
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(
        Sizes.paddingH10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '(352)',
                style: TextStyles.blueBoldF14(context),
              ),
              const SizedBox(
                width: Sizes.marginH5,
              ),
              Text(
                'عنصر',
                style: TextStyles.blackMediumF14(context),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'الإجمالي',
                style: TextStyles.blueBoldF14(context),
              ),
              const SizedBox(
                width: Sizes.marginH7,
              ),
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
    );
  }
}
