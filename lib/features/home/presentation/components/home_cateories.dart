import 'package:flutter/material.dart';

import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/widgets/cached_network_image_circular.dart';
import '../../../categories/domain/categories.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    required this.category,
    super.key,
  });
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CachedNetworkImageCircular(
          imageUrl: category.imageLink,
          radius: Sizes.widgetRadius30,
        ),
        Text(
          category.name,
          style: TextStyles.blackMediumF12(context),
        ),
      ],
    );
  }
}
