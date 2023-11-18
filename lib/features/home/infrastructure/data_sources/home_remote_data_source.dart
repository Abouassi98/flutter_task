import 'package:dio/dio.dart';

import '../../../../core/infrastructure/network/main_api/api_callers/main_api_facade.dart';
import '../../../../core/infrastructure/network/main_api/main_api_config.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../favourites/infrastructure/dto/products_dto/products_dto.dart';
part 'home_remote_data_source.g.dart';

@Riverpod(keepAlive: true)
HomeRemoteDataSource homeRemoteDataSource(HomeRemoteDataSourceRef ref) {
  return HomeRemoteDataSource(
    ref,
    mainApiFacade: ref.watch(mainApiFacadeProvider),
  );
}

class HomeRemoteDataSource {
  HomeRemoteDataSource(
    this.ref, {
    required this.mainApiFacade,
  });

  final HomeRemoteDataSourceRef ref;
  final MainApiFacade mainApiFacade;

  static String get productsPath => 'api/v1/products/';

  Future<ProductsDto> fetchProducts({
    required CancelToken? cancelToken,
  }) async {
    final response = await mainApiFacade.getData<List<dynamic>>(
      path: productsPath,
      options: Options(
        extra: {MainApiConfig.apiKeyExtraKey: true},
      ),
      cancelToken: cancelToken,
    );
    return ProductsDto.fromJson(response.data!);
  }

  Future<ProductDto> fetchProductById({
    required CancelToken? cancelToken,
    required int id,
  }) async {
    final response = await mainApiFacade.getData<Map<String, dynamic>>(
      path: 'api/v1/products/$id/',
      cancelToken: cancelToken,
    );
    return ProductDto.fromJson(response.data!);
  }

  Future<ProductsDto> fetchProductByCategoryId({
    required CancelToken? cancelToken,
    required int id,
  }) async {
    final response = await mainApiFacade.getData<List<dynamic>>(
      path: 'api/v1/products/category/$id/',
      cancelToken: cancelToken,
    );
    return ProductsDto.fromJson(response.data!);
  }
}
