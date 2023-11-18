import 'package:flutter/material.dart';
import '../../../../core/core_features/theme/presentation/utils/custom_colors.dart';
import '../../../../core/presentation/routing/app_router.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/cached_network_image_rectangle.dart';
import '../../../favourites/domain/products.dart';
import '../../../favourites/presentation/providers/fetch_fav_favourites_provider.dart';
import '../../../favourites/presentation/providers/add_fav_provider.dart';
import '../../../favourites/presentation/providers/remove_fav_provider.dart';

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
      child: Container(
        decoration: BoxDecoration(
          color: customColors(context).whiteColor,
          borderRadius: BorderRadius.circular(Sizes.buttonR5),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImageRectangle(
                  imageUrl: product.imageLink,
                ),
                HookBuilder(
                  key: UniqueKey(),
                  builder: (context) {
                    final favProducts =
                        ref.watch(fetchFavProductsProvider).requireValue.items;
                    final isFav = useState(
                      favProducts.any((element) => element.id == product.id),
                    );

                    return IconButton(
                      onPressed: () {
                        if (isFav.value) {
                          ref
                              .read(removeFavProductProvider.notifier)
                              .removeFavProduct(
                                product,
                              );
                        } else {
                          ref
                              .read(addFavProductProvider.notifier)
                              .addFavProduct(
                                product,
                              );
                        }
                        isFav.value = !isFav.value;
                      },
                      icon: Icon(
                        isFav.value ? Icons.favorite : Icons.favorite_border,
                        color: isFav.value
                            ? customColors(context).orangeColor
                            : customColors(context).greyColor,
                      ),
                    );
                  },
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.paddingH7,
                vertical: Sizes.paddingV10,
              ),
              color: Colors.white,
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
      ),
    );
  }
}
