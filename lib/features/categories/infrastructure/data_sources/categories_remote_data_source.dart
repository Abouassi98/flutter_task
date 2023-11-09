import 'package:dio/dio.dart';

import '../../../../core/infrastructure/network/main_api/api_callers/main_api_facade.dart';
import '../../../../core/infrastructure/network/main_api/main_api_config.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../dtos/categories_dto.dart';

part 'categories_remote_data_source.g.dart';

@Riverpod(keepAlive: true)
CategoriesRemoteDataSource categoriesRemoteDataSource(
    CategoriesRemoteDataSourceRef ref,) {
  return CategoriesRemoteDataSource(
    ref,
    mainApiFacade: ref.watch(mainApiFacadeProvider),
  );
}

class CategoriesRemoteDataSource {
  CategoriesRemoteDataSource(
    this.ref, {
    required this.mainApiFacade,
  });

  final CategoriesRemoteDataSourceRef ref;
  final MainApiFacade mainApiFacade;

  static String get articlesPath => 'categories';

  Future<CategoriesDto> fetchCategories({
    required CancelToken? cancelToken,
  }) async {
    final response = await mainApiFacade.getData<List<dynamic>>(
      path: articlesPath,
      options: Options(
        extra: {MainApiConfig.apiKeyExtraKey: true},
      ),
      cancelToken: cancelToken,
    );
    return CategoriesDto.fromJson(response.data!);
  }

  Future<CategoriesDto> fetchAssociatedPressArticles({
    required CancelToken? cancelToken,
  }) async {
    final response = await mainApiFacade.getData<List<dynamic>>(
      path: articlesPath,
      options: Options(
        extra: {MainApiConfig.apiKeyExtraKey: true},
      ),
      cancelToken: cancelToken,
    );
    return CategoriesDto.fromJson(response.data!);
  }
}
