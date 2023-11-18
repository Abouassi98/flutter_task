import 'package:flutter/material.dart';

import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/widgets/custom_shimmer.dart';
import 'home_items_list.dart';

class HomeAlbumItemShimmer extends StatelessWidget {
  const HomeAlbumItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: CustomShimmerContainer(
            height: Sizes.homeAlbumImageHight,
            width: Sizes.homeAlbumImageWidth,
            borderRadius: BorderRadius.circular(Sizes.homeAlbumImageRadius),
            boxShadow: HomeItemsList.cardShadowReduced,
          ),
        ),
        const SizedBox(
          height: Sizes.marginV16,
        ),
        CustomShimmerContainer(
          height: 14,
          width: 80,
          borderRadius: BorderRadius.circular(2),
          boxShadow: HomeItemsList.cardShadowReduced,
        ),
      ],
    );
  }
}
