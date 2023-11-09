import '../../../../core/presentation/providers/provider_utils.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../favourites/domain/products.dart';
import '../../infrastructure/repos/home_repo.dart';

part 'products_provider.g.dart';

@riverpod
Future<Products> products(ProductsRef ref) {
  final cancelToken = ref.cancelToken();
  final products =
      ref.watch(homeRepoProvider).fetchProducts(cancelToken: cancelToken);

  return products;
}
