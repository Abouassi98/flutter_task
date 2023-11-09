import 'package:flutter/material.dart';

import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/loading_widgets.dart';
import '../../../categories/presentation/providers/categories_provider.dart';
import 'home_cateories.dart';

class HomeCategoriesList extends ConsumerWidget {
  const HomeCategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);
    return categoriesAsync.when(
      data: (data) => ListView.separated(
        reverse: true,
        itemCount: data.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Row(
            children: [
              const SizedBox(
                width: Sizes.marginH16,
              ),
              HomeCategories(
                image: data.items[i].imageLink,
                name: data.items[i].name,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: Sizes.marginH8,
          );
        },
      ),
      loading: () => const LoadingIndicator(),
      error: (err, __) => ErrorWidget(err.toString()),
    );
  }
}
