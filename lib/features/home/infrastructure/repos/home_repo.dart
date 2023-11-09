import 'package:dio/dio.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import '../../../../core/infrastructure/network/network_info.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../favourites/domain/products.dart';
import '../../../favourites/infrastructure/data_source/products_local_data_source.dart';
import '../data_sources/home_remote_data_source.dart';

part 'home_repo.g.dart';

@Riverpod(keepAlive: true)
HomeRepo homeRepo(HomeRepoRef ref) {
  return HomeRepo(
    networkInfo: ref.watch(networkInfoProvider),
    remoteDataSource: ref.watch(homeRemoteDataSourceProvider),
    localDataSource: ref.watch(productsLocalDataSourceProvider),
  );
}

class HomeRepo {
  HomeRepo({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final NetworkInfo networkInfo;
  final HomeRemoteDataSource remoteDataSource;
  final ProductsLocalDataSource localDataSource;

  Future<Products> fetchProducts({CancelToken? cancelToken}) async {
    final productsDto =
        await remoteDataSource.fetchProducts(cancelToken: cancelToken);
    final favProducts = await localDataSource.fetchFavProducts().first;
    final products = productsDto.toDomain();
    final newProducts = products.items.map((element) {
      if (favProducts.any((object2) => object2.id == element.id)) {
        return element.copyWith(isFav: true);
      } else {
        return element.copyWith(isFav: false);
      }
    }).toIList();
    return Products(items: newProducts);
  }

  Future<Product> fetchProductById({
    required int id,
    CancelToken? cancelToken,
  }) async {
    final product = await remoteDataSource.fetchProductById(
      id: id,
      cancelToken: cancelToken,
    );
    return product.toDomain();
  }
}
