import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'products.dart';

part 'favourites_dto.freezed.dart';

@freezed
class Favourites with _$Favourites {
  const factory Favourites({
    required IList<Product> items,
  }) = _Favourites;
}
