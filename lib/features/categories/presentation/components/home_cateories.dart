import 'package:flutter/material.dart';

import '../../../../core/presentation/styles/styles.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    required this.name,
    required this.image,
    super.key,
  });
  final String name, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(
            image,
          ),
          radius: Sizes.widgetRadius30,
        ),
        const SizedBox(
          height: Sizes.widgetSizeV7,
        ),
        Text(
          name,
          style: TextStyles.blackMediumF12(context),
        ),
      ],
    );
  }
}
