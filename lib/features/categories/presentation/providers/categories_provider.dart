import '../../../../core/presentation/providers/provider_utils.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/categories.dart';
import '../../infrastructure/repos/categories_repo.dart';

part 'categories_provider.g.dart';

@riverpod
Future<Categories> categories(CategoriesRef ref) {
  final cancelToken = ref.cancelToken();
  return ref
      .watch(categoriesRepoProvider)
      .fetchCategories(cancelToken: cancelToken);
}
