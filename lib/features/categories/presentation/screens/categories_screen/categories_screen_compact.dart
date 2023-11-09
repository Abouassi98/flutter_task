import 'package:flutter/material.dart';

import '../../../../../core/infrastructure/services/connection_stream_service.dart';
import '../../../../../core/presentation/extensions/future_extensions.dart';
import '../../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../../core/presentation/styles/styles.dart';
import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../../core/presentation/widgets/custom_elevated_button.dart';

import '../../../../../core/presentation/widgets/platform_widgets/platform_refresh_indicator.dart';
import '../../../../../core/presentation/widgets/toasts.dart';
import '../../../domain/categories.dart';
import '../../components/category_components.dart';

import '../../providers/categories_provider.dart';

class CategoriesScreenCompact extends ConsumerWidget {
  const CategoriesScreenCompact({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(connectionStreamProvider, (prevState, newState) {
      newState.whenOrNull(
        data: (status) {
          Toasts.showConnectionToast(context, connectionStatus: status);
        },
      );
    });

    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final categoriesAsync = ref.watch(categoriesProvider);

          return PlatformRefreshIndicator(
            cacheExtent: 120 * 6,
            onRefresh: () {
              ref.invalidate(categoriesProvider);
              return ref.read(categoriesProvider.future).suppressError();
            },
            slivers: [
              categoriesAsync.when(
                skipLoadingOnReload: true,
                skipLoadingOnRefresh: !categoriesAsync.hasError,
                data: (articles) {
                  return articles.items.isNotEmpty
                      ? CategoriesList(articles: articles, isShimmer: false)
                      : SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: Text(
                              tr(context).noArticlesFound,
                              style: TextStyles.f20(context),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                },
                error: (error, st) => SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: CustomElevatedButton(
                      onPressed: () => ref.invalidate(categoriesProvider),
                      child: Text(
                        tr(context).retry,
                        style: TextStyles.coloredElevatedButton(context),
                      ),
                    ),
                  ),
                ),
                loading: () => CategoriesList(
                  articles: Categories.emptyArticles(),
                  isShimmer: true,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
