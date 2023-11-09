import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/products.dart';

import '../../infrastructure/repo/favourites_repo.dart';

part 'fetch_fav_favourites_provider.g.dart';

@riverpod
Stream<Products> fetchFavProducts(
  FetchFavProductsRef ref,
) {
  return ref.watch(favouritesRepoProvider).fetchProducts();
}
