import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/favourites_dto.dart';
import 'products_dto/products_dto.dart';

part 'favourites_dto.freezed.dart';

@freezed
class FavouritesDto with _$FavouritesDto {
  const factory FavouritesDto({
    required IList<ProductDto> items,
  }) = _FavouritesDto;

  const FavouritesDto._();

  Favourites toDomain() {
    return Favourites(items: items.map((m) => m.toDomain()).toIList());
  }
}
