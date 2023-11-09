import '../../../../core/presentation/providers/provider_utils.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../favourites/domain/products.dart';
import '../../infrastructure/repos/home_repo.dart';

part 'product_by_id.g.dart';

@riverpod
Future<Product> productById(ProductByIdRef ref, int id) {
  final cancelToken = ref.cancelToken();
  return ref
      .watch(homeRepoProvider)
      .fetchProductById(cancelToken: cancelToken, id: id);
}
