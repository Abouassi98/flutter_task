import 'package:flutter/material.dart';

import '../../../../../core/core_features/theme/presentation/utils/custom_colors.dart';
import '../../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/routing/app_router.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/cached_network_image_rectangle.dart';
import '../providers/fetch_fav_favourites_provider.dart';
import '../providers/remove_fav_provider.dart';

class FavouriteScreen extends HookConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fav = ref.watch(fetchFavProductsProvider).requireValue;
    return ListView.builder(
      itemCount: fav.items.length,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: customColors(context).whiteColor,
          borderRadius: BorderRadius.circular(
            Sizes.widgetRadius8,
          ),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: Sizes.marginH17,
          vertical: Sizes.marginV18,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CachedNetworkImageRectangle(
                  imageUrl: fav.items[index].imageLink,
                  maxWidthDiskCache: double.infinity,
                  maxHeightDiskCache: 250,
                ),
                HookBuilder(
                  builder: (context) {
                    return IconButton(
                      splashColor: Colors.transparent,
                      onPressed: () {
                        ref
                            .read(removeFavProductProvider.notifier)
                            .removeFavProduct(fav.items[index]);
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: customColors(context).orangeColor,
                      ),
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.paddingH16,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: Sizes.marginV11,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: Sizes.marginV9),
                    width: double.infinity,
                    child: Text(
                      fav.items[index].description,
                      textAlign: TextAlign.start,
                      style: TextStyles.blackMediumF16(context),
                    ),
                  ),
                  const SizedBox(
                    height: Sizes.marginV7,
                  ),
                  Row(
                    children: [
                      Text(
                        fav.items[index].price,
                        style: TextStyles.blueMediumF18(context),
                      ),
                      const SizedBox(
                        width: Sizes.widgetSizeH7,
                      ),
                      Text(
                        'ج.م',
                        style: TextStyles.blueBoldF14(context),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Sizes.marginV10,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      const CartRoute().go(context);
                    },
                    child: Container(
                      height: Sizes.widgetSizeV45,
                      decoration: BoxDecoration(
                        color: customColors(context).blueColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(
                            Sizes.widgetRadius8,
                          ), // Adjust the radius to control the rounding
                          bottomRight: Radius.circular(Sizes.widgetRadius8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'نقل إلى سلة التسوق',
                          style: TextStyles.whiteBoldF16(context),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
