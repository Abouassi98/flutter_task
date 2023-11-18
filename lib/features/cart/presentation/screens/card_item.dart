import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/core_features/theme/presentation/utils/custom_colors.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/cached_network_image_rectangle.dart';
import '../../../../gen/my_assets.dart';
import '../../../favourites/domain/products.dart';

class CartItem extends HookConsumerWidget {
  const CartItem({
    required this.totalPriceNotifier,
    required this.product,
    super.key,
  });
  final ValueNotifier<double> totalPriceNotifier;
  final Product product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                child: CachedNetworkImageRectangle(
                  imageUrl: product.imageLink,
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
                      product.description,
                      textAlign: TextAlign.start,
                      maxLines: 3,
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
                          product.price,
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
                      totalPriceNotifier.value += double.parse(product.price);
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
                      if (itemCount.value > 0) {
                        totalPriceNotifier.value -= double.parse(product.price);
                        itemCount.value--;
                      }
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
                      (double.parse(product.price) * itemCount.value)
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
              Container(
                height: Sizes.widgetSizeV38,
                width: Sizes.widgetSizeV38,
                decoration: BoxDecoration(
                  color: customColors(context).orangeColor,
                ),
                child: SvgPicture.asset(
                  MyAssets.ASSETS_IMAGES_CORE_DELETE_FOREVER_24PX_SVG,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
