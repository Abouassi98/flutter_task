import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/core_features/theme/presentation/utils/custom_colors.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../gen/my_assets.dart';

final List<String> imageList = [
  MyAssets.ASSETS_IMAGES_CORE_CATEGORY_JPG,
  MyAssets.ASSETS_IMAGES_CORE_CATEGORY_JPG,
  MyAssets.ASSETS_IMAGES_CORE_CATEGORY_JPG,
  MyAssets.ASSETS_IMAGES_CORE_CATEGORY_JPG,
  MyAssets.ASSETS_IMAGES_CORE_CATEGORY_JPG,
];

class CarouselSliderPage extends HookWidget {
  const CarouselSliderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HookBuilder(
      builder: (context) {
        final currentIndex = useState<int>(0);
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: Sizes.widgetSizeV140,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  currentIndex.value = index;
                },
              ),
              items: imageList.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Sizes.widgetRadius20),
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: Sizes.marginV7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => Container(
                  width: Sizes.widgetSizeH13,
                  height: Sizes.widgetSizeV3,
                  margin: const EdgeInsets.symmetric(
                    vertical: Sizes.marginV10,
                    horizontal: Sizes.marginH2,
                  ),
                  decoration: BoxDecoration(
                    color: currentIndex.value == index
                        ? customColors(context).blueColor
                        : Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(Sizes.widgetRadius30),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
