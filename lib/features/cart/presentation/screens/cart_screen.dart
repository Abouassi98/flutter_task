import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import '../../../../core/presentation/screens/nested_screen_scaffold.dart';
import '../../../../core/presentation/styles/styles.dart';

import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../components/cart_card.dart';
import '../components/copoun_compnent.dart';
import '../components/footer_component.dart';
import '../components/total_component.dart';

class CartScreen extends HookConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPriceNotifier = useValueNotifier<double>(0);
    return NestedScreenScaffold(
      body: CustomScrollView(
        cacheExtent: Sizes.homeAlbumImageWidth * 6,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(
              top: Sizes.screenPaddingV24,
              bottom: Sizes.screenPaddingV24 + Sizes.homeIndicatorHeight,
              right: Sizes.screenPaddingH24,
              left: Sizes.screenPaddingH24,
            ),
            sliver: MultiSliver(
              children: [
                TotalComponent(totalPriceNotifier: totalPriceNotifier),
                CartCard(totalPriceNotifier: totalPriceNotifier),
                const CopounComponent(),
                FooterComponent(totalPriceNotifier: totalPriceNotifier),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
