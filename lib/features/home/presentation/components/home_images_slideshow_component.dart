import 'package:flutter/material.dart';

import '../../../../auth/presentation/components/image_slideshow/image_slideshow.dart';
import '../../../../core/core_features/theme/presentation/utils/custom_colors.dart';

import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../gen/my_assets.dart';

class HomeImagesSlideShowComponent extends HookWidget {
  const HomeImagesSlideShowComponent({super.key});

  static const _slideShowImages = [
    MyAssets.ASSETS_IMAGES_CORE_CATEGORY_JPG,
    MyAssets.ASSETS_IMAGES_CORE_ADD_PNG,
  ];

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          for (final image in _slideShowImages) {
            precacheImage(AssetImage(image), context);
          }
        });
        return null;
      },
      [],
    );
    return ImageSlideshow(
      isLoop: true,
      autoPlayInterval: 2000,
      height: 140,
      indicatorActiveColor: Theme.of(context).colorScheme.secondary,
      indicatorInactiveColor: customColors(context).greyColor,
      children: List.generate(
        _slideShowImages.length,
        (index) =>
            _SlideShowImage(index: index, image: _slideShowImages[index]),
      ),
    );
  }
}

class _SlideShowImage extends StatelessWidget {
  const _SlideShowImage({
    required this.index,
    required this.image,
  });

  final int index;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(index),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
