import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/core_features/theme/presentation/utils/custom_colors.dart';
import '../../../../../core/presentation/routing/navigation_service.dart';
import '../../../../../core/presentation/styles/styles.dart';
import '../../../../favourites/domain/products.dart';

class HomeDetailsScreen extends HookWidget {
  const HomeDetailsScreen({required this.product, super.key});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: customColors(context).whiteColor,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    SizedBox(
                      height: Sizes.widgetSizeV340,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: product.imageLink,
                        fit: BoxFit.fill,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        NavigationService.pop<void>(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: customColors(context).greyColor,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Sizes.paddingH20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      HookBuilder(
                        builder: (context) {
                          final isFavorite = useState(true);
                          return Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  isFavorite.value = !isFavorite.value;
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: isFavorite.value
                                      ? customColors(context).orangeColor
                                      : customColors(context).greyColor,
                                ),
                              ),
                              Text(
                                'مضاف للمفضلة',
                                style: isFavorite.value
                                    ? TextStyles.orangeBoldF14(context)
                                    : TextStyles.greyBoldF14(context),
                              ),
                            ],
                          );
                        },
                      ),
                      Container(
                        color: Colors.black,
                        height: 50,
                        width: 1,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.share),
                          ),
                          Text(
                            'مشاركة المنتج',
                            style: TextStyles.blackMediumF14(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.paddingH16),
            child: Column(
              children: [
                const SizedBox(
                  height: Sizes.marginV20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    product.description,
                    style: TextStyles.blackMediumF16(context),
                    textScaleFactor: 1.1,
                  ),
                ),
                const SizedBox(
                  height: Sizes.marginV9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          product.price,
                          style: TextStyles.blueMediumF18(context),
                        ),
                        Text(
                          'ج.م',
                          style: TextStyles.blueBoldF14(context),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          product.rate,
                          style: TextStyles.blackMediumF14(context),
                        ),
                        const SizedBox(
                          width: Sizes.marginH5,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الوصف',
                      style: TextStyles.blackMediumF16(context),
                    ),
                    const SizedBox(
                      width: Sizes.marginH5,
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: Sizes.marginV8,
                ),
                HookBuilder(
                  builder: (context) {
                    final itemCount = useState(0);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                itemCount.value++;
                              },
                              child: Container(
                                width: Sizes.widgetSizeH45,
                                height: Sizes.widgetSizeV45,
                                decoration: BoxDecoration(
                                  color: customColors(context)
                                      .blueColor, // Set the background color
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(
                                      Sizes.widgetRadius5,
                                    ), // Set the top left corner radius
                                    bottomRight: Radius.circular(
                                      Sizes.widgetRadius5,
                                    ), // Set the bottom left corner radius
                                  ), // Set the border radius
                                ),
                                child: const Center(child: Icon(Icons.add)),
                              ),
                            ),
                            Container(
                              width: Sizes.widgetSizeH70,
                              height: Sizes.widgetSizeV45,
                              color: customColors(context).whiteColor,
                              child: Center(child: Text('${itemCount.value}')),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (itemCount.value > 0) itemCount.value--;
                              },
                              child: Container(
                                width: Sizes.widgetSizeH45,
                                height: Sizes.widgetSizeV45,
                                decoration: BoxDecoration(
                                  color: customColors(context)
                                      .blueColor, // Set the background color
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(
                                      Sizes.widgetRadius5,
                                    ), // Set the top left corner radius
                                    bottomLeft: Radius.circular(
                                      Sizes.widgetRadius5,
                                    ), // Set the bottom left corner radius
                                  ), // Set the border radius
                                ),
                                child: const Center(child: Icon(Icons.remove)),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.paddingH32,
                            vertical: Sizes.paddingV14,
                          ),
                          decoration: BoxDecoration(
                            color: customColors(context)
                                .whiteColor, // Set the background color
                            borderRadius: BorderRadius.circular(
                              Sizes.widgetRadius5,
                            ), // Set the border radius
                          ),
                          child: Row(
                            children: [
                              Text(
                                (398.00 * itemCount.value).toStringAsFixed(2),
                                style: TextStyles.blackMediumF16(context),
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
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: Sizes.marginV28,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: IntrinsicWidth(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.paddingV10,
                        horizontal: Sizes.paddingH7,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.add_shopping_cart),
                          const SizedBox(
                            width: Sizes.marginH10,
                          ),
                          Text(
                            'أضف للسلة',
                            style: TextStyles.whiteBoldF16(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
