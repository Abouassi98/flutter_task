import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'category.dart';

part 'products.freezed.dart';

@freezed
class Product with _$Product {
  factory Product({
    required int id,
    required String name,
    @JsonKey(name: 'image_link') required String imageLink,
    required String price,
    required String description,
    required String rate,
    required Category category,
    required bool isFav,
  }) = _Product;
  const Product._();
  // Product copyWithIsFav({required bool isFavParms}) {
  //   return copyWith(
  //     isFav: isFavParms,
  //   );
  // }
}

@freezed
class Products with _$Products {
  const factory Products({
    required IList<Product> items,
  }) = _Favourites;
}
