import '../../../../core/presentation/providers/provider_utils.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../favourites/domain/products.dart';
import '../../infrastructure/repos/home_repo.dart';

part 'products_by_category_id_provider.g.dart';

@riverpod
Future<Products> productsByCategoryId(ProductsByCategoryIdRef ref, int id) {
  final cancelToken = ref.cancelToken();
  final products = ref
      .watch(homeRepoProvider)
      .fetchProductByCategoryId(cancelToken: cancelToken, id: id);

  return products;
}
