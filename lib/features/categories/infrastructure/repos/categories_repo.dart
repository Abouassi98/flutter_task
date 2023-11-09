import 'package:dio/dio.dart';

import '../../../../core/infrastructure/network/network_info.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/categories.dart';
import '../data_sources/categories_remote_data_source.dart';

part 'categories_repo.g.dart';

@Riverpod(keepAlive: true)
CategoriesRepo categoriesRepo(CategoriesRepoRef ref) {
  return CategoriesRepo(
    networkInfo: ref.watch(networkInfoProvider),
    remoteDataSource: ref.watch(categoriesRemoteDataSourceProvider),
  );
}

class CategoriesRepo {
  CategoriesRepo({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  final NetworkInfo networkInfo;
  final CategoriesRemoteDataSource remoteDataSource;

  Future<Categories> fetchCategories({CancelToken? cancelToken}) async {
    final categories =
        await remoteDataSource.fetchCategories(cancelToken: cancelToken);

    return categories.toDomain();
  }
}
