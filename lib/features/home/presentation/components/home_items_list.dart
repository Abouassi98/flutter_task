import 'package:flutter/material.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../favourites/domain/products.dart';
import 'home_items.dart';

class HomeItemsList extends ConsumerWidget {
  const HomeItemsList({
    required this.list,
    required this.title,
    super.key,
  });
  final Products list;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(Sizes.buttonPaddingV8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyles.blackBoldF14(context),
              ),
              Text(
                'عرض الكل',
                style: TextStyles.blackMediumF12(context),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Sizes.widgetSizeV210,
          width: double.infinity,
          child: ListView.separated(
            itemCount: list.items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return SizedBox(
                width: Sizes.widgetSizeV135,
                child: HomeItems(
                  product: list.items[i],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: Sizes.marginH16,
              );
            },
          ),
        ),
      ],
    );
  }
}
