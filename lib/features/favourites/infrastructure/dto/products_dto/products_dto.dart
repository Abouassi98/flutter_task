import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import '../../../domain/products.dart';
import '../../../../categories/infrastructure/dtos/category_dto.dart';

part 'products_dto.freezed.dart';
part 'products_dto.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ProductDto with _$ProductDto {
  factory ProductDto({
    required int id,
    required String name,
    @JsonKey(name: 'image_link') required String imageLink,
    required String price,
    required String description,
    required String rate,
    required CategoryDto category,
    @Default(false) bool isFav,
  }) = _ProductDto;
  @ignore
  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  const ProductDto._();

  factory ProductDto.fromDomain(Product products) {
    return ProductDto(
      category: CategoryDto.fromDomain(products.category),
      description: products.description,
      id: products.id,
      imageLink: products.imageLink,
      name: products.name,
      price: products.price,
      rate: products.rate,
      isFav: products.isFav,
    );
  }
  @override
  Id get id;
  @ignore
  Product toDomain() {
    return Product(
      id: id,
      imageLink: imageLink,
      name: name,
      isFav: isFav,
      category: category.toDomain(),
      description: description,
      price: price,
      rate: rate,
    );
  }
}

@freezed
class ProductsDto with _$ProductsDto {
  const factory ProductsDto({
    required IList<ProductDto> products,
  }) = _ProductsDto;

  const ProductsDto._();
  factory ProductsDto.fromJson(List<dynamic> json) =>
      _$ProductsDtoFromJson({'products': json});
  factory ProductsDto.fromDomain(Products products) {
    return ProductsDto(
      products: products.items.map(ProductDto.fromDomain).toIList(),
    );
  }

  Products toDomain() {
    return Products(items: products.map((m) => m.toDomain()).toIList());
  }
}
