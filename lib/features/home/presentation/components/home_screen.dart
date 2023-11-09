import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_feeds_app/features/home/presentation/components/search_widget.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../favourites/domain/products.dart';
import 'carousel_widget.dart';
import 'home_cateories_list.dart';
import 'home_items_list.dart';

class HomeComponent extends ConsumerWidget {
  const HomeComponent({required this.articles, super.key});
  final Products articles;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(Sizes.screenPaddingH16),
          child: SearchComponent(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.screenPaddingH16),
          child: SizedBox(
            height: Sizes.widgetSizeV170,
            child: CarouselSliderPage(),
          ),
        ),
        const SizedBox(
          height: Sizes.marginV18,
        ),
        const Padding(
          padding: EdgeInsets.only(right: Sizes.screenPaddingH16),
          child: SizedBox(
            height: Sizes.widgetSizeV100,
            child: HomeCategoriesList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: Sizes.screenPaddingH16),
          child: HomeItemsList(
            list: articles,
            title: 'وصل حديثا',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: Sizes.screenPaddingH16),
          child: HomeItemsList(
            list: articles,
            title: 'الأكثر شعبية',
          ),
        ),
      ],
    );
  }
}
