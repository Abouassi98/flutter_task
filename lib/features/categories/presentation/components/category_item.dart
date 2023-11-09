part of 'category_components.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({
    required this.article,
    super.key,
  });

  final Category article;

  static const mediumVGap = SizedBox(height: Sizes.marginV12);

  static const smallVGap = SizedBox(height: Sizes.marginV4);

  @override
  Widget build(BuildContext context) {
    return ResponsiveCenter(
      child: Container(
        decoration: CategoriesList.cardDecoration(context),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CachedNetworkImageRounded(
              imageUrl: article.imageLink,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(CategoriesList.cardRadius),
              ),
              height: 122,
            ),
            Center(child: Text(article.name, style: TextStyles.whiteMediumF24(context))),
          ],
        ),
      ),
    );
  }
}
