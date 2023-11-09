import 'package:freezed_annotation/freezed_annotation.dart';
part 'category.freezed.dart';


@freezed
class Category with _$Category {
  factory Category({
    required int id,
    required String name,
    required String imageLink,
  }) = _CategoryDto;
}
