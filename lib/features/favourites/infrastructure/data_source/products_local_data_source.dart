import 'package:isar/isar.dart';
import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../dto/products_dto/products_dto.dart';

part 'products_local_data_source.g.dart';

@riverpod
Isar productsIsar(ProductsIsarRef ref) {
  final isar = Isar.openSync([ProductDtoSchema], name: 'isar');

  ref.onDispose(isar.close);

  return isar;
}

@Riverpod(keepAlive: true)
ProductsLocalDataSource productsLocalDataSource(
  ProductsLocalDataSourceRef ref,
) {
  return ProductsLocalDataSource(ref: ref);
}

class ProductsLocalDataSource {
  ProductsLocalDataSource({required this.ref});

  final ProductsLocalDataSourceRef ref;
  Isar get _isar => ref.read(productsIsarProvider);

  Stream<List<ProductDto>> fetchFavProducts() async* {
    yield* _isar.productDtos
        .where()
        .filter()
        .isFavEqualTo(true)
        .watch(fireImmediately: true);
  }

  void toggleFavProduct(ProductDto dto) {
    if (dto.isFav) {
      _isar.writeTxnSync(
        () => _isar.productDtos.putSync(dto.copyWith(isFav: false)),
      );
    } else {
      _isar.writeTxnSync(
        () => _isar.productDtos.putSync(dto.copyWith(isFav: true)),
      );
    }
  }
}
