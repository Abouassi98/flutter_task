import 'package:dio/dio.dart';
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

    return productsDto.toDomain();
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

  Future<Products> fetchProductByCategoryId({
    required int id,
    CancelToken? cancelToken,
  }) async {
    final product = await remoteDataSource.fetchProductByCategoryId(
      id: id,
      cancelToken: cancelToken,
    );
    return product.toDomain();
  }
}
