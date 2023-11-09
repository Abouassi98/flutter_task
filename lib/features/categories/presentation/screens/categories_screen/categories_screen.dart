import 'package:flutter/material.dart';

import '../../../../../core/presentation/widgets/responsive_widgets/responsive_layouts.dart';
import 'categories_screen_compact.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowClassLayout(
      compact: (_) => OrientationLayout(
        portrait: (_) => const CategoriesScreenCompact(),
      ),
    );
  }
}
