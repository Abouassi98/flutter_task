import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/products.dart';
import '../../infrastructure/repo/favourites_repo.dart';
import 'fetch_fav_favourites_provider.dart';

part 'remove_fav_provider.g.dart';

//Using [Option] to indicate idle(none)/success(some) states.
//This is a shorthand. You can use custom states using [freezed] instead.
@riverpod
class RemoveFavProduct extends _$RemoveFavProduct {
  @override
  FutureOr<Option<Unit>> build() => const None();

  Future<void> removeFavProduct(Product params) async {
    ref.listenSelf((previous, next) {
      next.whenData(
        (value) => value.match(
          () => null,
          (t) => ref.read(fetchFavProductsProvider.future),
        ),
      );
    });
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final authRepo = ref.read(favouritesRepoProvider);
      authRepo.removeFavProduct(product: params);
      return const Some(unit);
    });
  }
}
