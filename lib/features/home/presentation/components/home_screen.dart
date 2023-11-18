import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'home_items_list.dart';

class HomeComponent extends ConsumerWidget {
  const HomeComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        HomeItemsList(
          title: 'وصل حديثا',
          id: 1,
        ),
        HomeItemsList(
          title: 'الأكثر شعبية',
          id: 5,
        ),
      ],
    );
  }
}
