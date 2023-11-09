import 'package:flutter/material.dart';

import '../../../../core/core_features/theme/presentation/utils/custom_colors.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/custom_elevated_button.dart';
import '../../../../core/presentation/widgets/loading_widgets.dart';
import '../../../favourites/presentation/providers/fetch_fav_favourites_provider.dart';

class CartCard extends HookConsumerWidget {
  const CartCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAsync = ref.watch(fetchFavProductsProvider);
    return cartAsync.when(
      data: (item) {
        return Expanded(
          flex: 2,
          child: ListView.builder(
            itemCount: item.items.length,
            itemBuilder: (context, index) {
              return HookBuilder(
                builder: (context) {
                  final itemCount = useState<int>(0);
                  return Container(
                    margin: const EdgeInsets.only(bottom: Sizes.marginV16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Sizes.widgetRadius5,
                      ), // Adjust the radius as needed
                      color: customColors(context).whiteColor,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(
                                  Sizes.widgetRadius5,
                                ), // Adjust the radius as needed
                              ),
                              child: Image.network(
                                item.items[index].imageLink,
                                width: Sizes.widgetSizeH123,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(
                              width: Sizes.marginH8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                    top: Sizes.marginV9,
                                  ),
                                  width: Sizes.widgetSizeH188,
                                  child: Text(
                                    item.items[index].description,
                                    textAlign: TextAlign.start,
                                    style: TextStyles.blackMediumF12(context),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    bottom: Sizes.marginV14,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        item.items[index].price,
                                        style: TextStyles.blueBoldF14(context),
                                      ),
                                      Text(
                                        'ج.م',
                                        style: TextStyles.blackMediumF12(
                                          context,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(height: 1, color: Colors.black),
                        Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    itemCount.value++;
                                  },
                                  child: Container(
                                    width: Sizes.widgetSizeH38,
                                    height: Sizes.widgetSizeV38,
                                    decoration: BoxDecoration(
                                      color: customColors(context).blueColor,
                                      borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(6),
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: customColors(context).whiteColor,
                                        size: Sizes
                                            .icon24, // You can adjust the icon size as needed
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Sizes.widgetSizeH47,
                                  height: Sizes.widgetSizeV38,
                                  child: Center(
                                    child: Text(
                                      '${itemCount.value}',
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (itemCount.value > 0) itemCount.value--;
                                  },
                                  child: Container(
                                    width: Sizes.widgetSizeH38,
                                    height: Sizes.widgetSizeV38,
                                    decoration: BoxDecoration(
                                      color: customColors(context).blueColor,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: customColors(context).whiteColor,
                                        size: Sizes
                                            .icon24, // You can adjust the icon size as needed
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    (69.650 * itemCount.value)
                                        .toStringAsFixed(2),
                                    style: TextStyles.blackMediumF16(context),
                                  ),
                                  Text(
                                    'ج.م',
                                    style: TextStyles.blackMediumF12(context),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        );
      },
      error: (_, __) => Container(
        height: 160,
        alignment: Alignment.center,
        child: CustomElevatedButton(
          onPressed: () => ref.invalidate(fetchFavProductsProvider),
          child: Text(
            'retry',
            style: TextStyles.coloredElevatedButton(context),
          ),
        ),
      ),
      loading: () => const SizedBox(
        height: 160,
        child: LoadingIndicator(),
      ),
    );
  }
}
