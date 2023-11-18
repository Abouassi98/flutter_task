import 'package:flutter/material.dart';
import '../../../../core/core_features/theme/presentation/utils/app_static_colors.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';

import '../../../../core/presentation/widgets/custom_retry_widget.dart';
import '../../../../core/presentation/widgets/seperated_sliver_child_builder_delegate.dart';
import '../providers/products_by_category_id_provider.dart';
import 'home_album_item_shimmer.dart';
import 'home_items.dart';

class HomeItemsList extends ConsumerWidget {
  const HomeItemsList({
    required this.title,
    required this.id,
    super.key,
  });
  final int id;
  final String title;

  static const cardShadow = AppStaticColors.boxShadowBlack25;
  static const cardShadowReduced = AppStaticColors.boxShadowBlack25Reduced;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 230,
      child: Column(
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
          Expanded(
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              cacheExtent: Sizes.homeAlbumImageWidth * 6,
              slivers: [
                Consumer(
                  builder: (context, ref, child) {
                    final productsByCategoryIdAsync =
                        ref.watch(productsByCategoryIdProvider(id));
                    return productsByCategoryIdAsync.when(
                      data: (data) => SliverList(
                        delegate: SeparatedSliverChildBuilderDelegate(
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: Sizes.marginH16,
                            );
                          },
                          itemCount: data.items.length,
                          itemBuilder: (context, index) {
                            return HomeItems(
                              product: data.items[index],
                            );
                          },
                        ),
                      ),
                      error: (_, __) => SliverToBoxAdapter(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: CustomRetryWidget(
                            onPressed: () {
                              ref.read(
                                productsByCategoryIdProvider(id),
                              );
                            },
                            height: Sizes.homeAlbumImageHight,
                            width: Sizes.homeAlbumImageWidth,
                            borderRadius: BorderRadius.circular(
                              Sizes.homeAlbumImageRadius,
                            ),
                            boxShadow: cardShadowReduced,
                          ),
                        ),
                      ),
                      loading: () => const SliverToBoxAdapter(
                        child: HomeAlbumItemShimmer(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
