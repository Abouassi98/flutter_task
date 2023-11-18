import 'package:flutter/material.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../favourites/presentation/providers/fetch_fav_favourites_provider.dart';
import '../screens/card_item.dart';

class CartCard extends HookConsumerWidget {
  const CartCard({
    required this.totalPriceNotifier,
    super.key,
  });
  final ValueNotifier<double> totalPriceNotifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carts = ref.watch(fetchFavProductsProvider).requireValue.items;
    return SliverList.separated(
      itemCount: carts.length,
      itemBuilder: (context, index) {
        return CartItem(
          totalPriceNotifier: totalPriceNotifier,
          product: carts[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: Sizes.marginV12,
      ),
    );
  }
}
