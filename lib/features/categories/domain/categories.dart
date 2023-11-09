import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories.freezed.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    required String name,
    required String imageLink,
  }) = _Category;
}

@freezed
class Categories with _$Categories {
  const factory Categories({
    required IList<Category> items,
  }) = _Categories;

  factory Categories.emptyArticles() => Categories(
        items: List.generate(6, (index) => _emptyArticle).toIList(),
      );

  static Category get _emptyArticle => const Category(
        id: 1,
        imageLink:
            'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/assortment-of-colorful-ripe-tropical-fruits-top-royalty-free-image-995518546-1564092355.jpg',
        name: 'Food',
      );
}
