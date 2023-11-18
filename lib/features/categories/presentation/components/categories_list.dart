part of 'category_components.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    required this.articles,
    required this.isShimmer,
    super.key,
  });

  final Categories articles;
  final bool isShimmer;

  static const cardRadius = 5.0;

  static BoxDecoration cardDecoration(BuildContext context) => BoxDecoration(
        borderRadius: BorderRadius.circular(cardRadius),
        color: customColors(context).whiteColor,
      );

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        top: Sizes.screenPaddingV24,
        bottom: Sizes.screenPaddingV24 + Sizes.homeIndicatorHeight,
        right: Sizes.screenPaddingH24,
        left: Sizes.screenPaddingH24,
      ),
      sliver: SliverList(
        delegate: SeparatedSliverChildBuilderDelegate(
          itemCount: articles.items.length,
          itemBuilder: (BuildContext context, int index) {
            return isShimmer
                ? CustomShimmerContainer(
                    borderRadius: cardDecoration(context).borderRadius,
                    child: ArticleItem(article: articles.items[index]),
                  )
                : GestureDetector(
                    key: ValueKey(articles.items[index].id),
                    onTap: () {
                      //   ArticleDetailsRoute(index).go(context);
                    },
                    child: ArticleItem(article: articles.items[index]),
                  );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: Sizes.marginV20);
          },
        ),
      ),
    );
  }
}
