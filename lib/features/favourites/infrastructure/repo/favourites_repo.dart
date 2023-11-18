import 'dart:async';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import '../../../../core/infrastructure/network/network_info.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/products.dart';
import '../data_source/products_local_data_source.dart';
import '../dto/products_dto/products_dto.dart';
part 'favourites_repo.g.dart';

@Riverpod(keepAlive: true)
FavouritesRepo favouritesRepo(FavouritesRepoRef ref) {
  return FavouritesRepo(
    networkInfo: ref.watch(networkInfoProvider),
    localDataSource: ref.watch(productsLocalDataSourceProvider),
  );
}

class FavouritesRepo {
  FavouritesRepo({
    required this.networkInfo,
    required this.localDataSource,
  });

  final NetworkInfo networkInfo;

  final ProductsLocalDataSource localDataSource;

  Stream<Products> fetchProducts() async* {
    await for (final files in localDataSource.fetchFavProducts()) {
      yield Products(items: files.map((f) => f.toDomain()).toIList());
    }
  }

  void addFavProduct({required Product product}) {
    final dto = ProductDto.fromDomain(product);
    return localDataSource.addFavProduct(dto);
  }
  void removeFavProduct({required Product product}) {
    final dto = ProductDto.fromDomain(product);
    return localDataSource.removeFavProduct(dto);
  }
}
