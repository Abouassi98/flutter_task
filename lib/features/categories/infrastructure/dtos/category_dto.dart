import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../favourites/domain/category.dart';
import 'package:isar/isar.dart';
part 'category_dto.freezed.dart';
part 'category_dto.g.dart';

@freezed
@Embedded(ignore: {'copyWith'})
class CategoryDto with _$CategoryDto {
  factory CategoryDto({
    int? id,
    @JsonKey(name: 'image_link') String? imageLink,
    String? name,
  }) = _CategoryDto;
  const CategoryDto._();
  @ignore
  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);
  factory CategoryDto.fromDomain(Category category) {
    return CategoryDto(
      id: category.id,
      imageLink: category.imageLink,
      name: category.name,
    );
  }

  @ignore
  Category toDomain() {
    return Category(id: id!, imageLink: imageLink!, name: name!);
  }
}
