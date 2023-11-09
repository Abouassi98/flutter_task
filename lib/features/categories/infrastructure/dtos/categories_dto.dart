import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/categories.dart';
part 'categories_dto.freezed.dart';
part 'categories_dto.g.dart';

@Freezed(toJson: false)
class CategoryDto with _$CategoryDto {
  const factory CategoryDto({
    required int id,
    required String name,
    @JsonKey(name: 'image_link') required String imageLink,
  }) = _CategoryDto;

  const CategoryDto._();

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  Category toDomain() {
    return Category(
      id: id,
      imageLink: imageLink,
      name: name,
    );
  }
}

@Freezed(toJson: false)
class CategoriesDto with _$CategoriesDto {
  const factory CategoriesDto({
    required IList<CategoryDto> categories,
  }) = _CategoriesDto;

  const CategoriesDto._();

  factory CategoriesDto.fromJson(List<dynamic> json) =>
      _$CategoriesDtoFromJson({'categories': json});

  Categories toDomain() {
    return Categories(items: categories.map((e) => e.toDomain()).toIList());
  }
}
