import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../home/presentation/providers/products_provider.dart';
import '../../domain/products.dart';
import '../../infrastructure/repo/favourites_repo.dart';

part 'add_fav_provider.g.dart';

//Using [Option] to indicate idle(none)/success(some) states.
//This is a shorthand. You can use custom states using [freezed] instead.
@riverpod
class AddFavProduct extends _$AddFavProduct {
  @override
  FutureOr<Option<Unit>> build() => const None();

  Future<void> toggleFavProduct(Product params) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final authRepo = ref.read(favouritesRepoProvider);
      authRepo.addFavProduct(product: params);
      ref.invalidate(productsProvider);
      return const Some(unit);
    });
  }
}
