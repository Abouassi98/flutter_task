import 'package:flutter/material.dart';
import '../../../../core/core_features/theme/presentation/utils/custom_colors.dart';
import '../../../../core/presentation/routing/app_router.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../favourites/domain/products.dart';
import '../../../favourites/presentation/providers/add_fav_provider.dart';

class HomeItems extends HookConsumerWidget {
  const HomeItems({
    required this.product,
    super.key,
  });
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        HomeDetailsRoute($extra: product).go(context);
      },
      child: Column(
        children: [
          Container(
            height: Sizes.widgetSizeV115,
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(Sizes.widgetRadius5),
                topRight: Radius.circular(Sizes.widgetRadius5),
              ),
              image: DecorationImage(
                image: NetworkImage(product.imageLink),
                fit: BoxFit.cover,
              ),
            ),
            child: HookBuilder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    ref.read(addFavProductProvider.notifier).toggleFavProduct(
                          product,
                        );
                  },
                  icon: Icon(
                    product.isFav ? Icons.favorite : Icons.favorite_border,
                    color: product.isFav
                        ? customColors(context).orangeColor
                        : customColors(context).greyColor,
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.paddingH7,
              vertical: Sizes.paddingV10,
            ),
            color: Colors.white,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Sizes.widgetSizeV24,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    product.name,
                    style: TextStyles.blackMediumF12(context),
                  ),
                ),
                const SizedBox(
                  height: Sizes.marginH8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          product.price,
                          style: TextStyles.blueBoldF14(context),
                        ),
                        Text('ج.م', style: TextStyles.blueMediumF12(context)),
                      ],
                    ),
                    Icon(
                      Icons.add_shopping_cart_outlined,
                      color: customColors(context).greyColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
