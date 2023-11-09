import 'package:flutter/material.dart';

import '../../../../../core/infrastructure/services/connection_stream_service.dart';
import '../../../../../core/presentation/extensions/future_extensions.dart';
import '../../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../../core/presentation/styles/styles.dart';
import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../../core/presentation/widgets/custom_appbar.dart';
import '../../../../../core/presentation/widgets/custom_elevated_button.dart';
import '../../../../../core/presentation/widgets/loading_widgets.dart';
import '../../../../../core/presentation/widgets/platform_widgets/platform_appbar.dart';
import '../../../../../core/presentation/widgets/platform_widgets/platform_refresh_indicator.dart';
import '../../../../../core/presentation/widgets/toasts.dart';
import '../../../../../gen/my_assets.dart';
import '../../components/home_screen.dart';
import '../../providers/products_provider.dart';

class HomeScreenCompact extends ConsumerWidget {
  const HomeScreenCompact({super.key});

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
      appBar: PlatformAppBar(
        appbar: CustomAppBar(
          hasMenuButton: true,
          title: Text(
            tr(context).linkDevelopment.toUpperCase(),
            style: TextStyles.appBarTitle(context),
          ),
          trailingActions: [
            Container(
              width: Sizes.appBarLeadingWidth,
              alignment: Alignment.center,
              child: Image.asset(
                MyAssets.ASSETS_ICONS_SEARCH_PNG,
                fit: BoxFit.contain,
                height: 28,
                width: 28,
              ),
            ),
          ],
        ),
      ),
      //    drawer: const HomeDrawer(),
      body: Consumer(
        builder: (context, ref, child) {
          final productAsync = ref.watch(productsProvider);

          return PlatformRefreshIndicator(
            cacheExtent: 120 * 6,
            onRefresh: () {
              ref.invalidate(productsProvider);
              return ref.read(productsProvider.future).suppressError();
            },
            slivers: [
              productAsync.when(
                skipLoadingOnReload: true,
                skipLoadingOnRefresh: !productAsync.hasError,
                data: (articles) {
                  return articles.items.isNotEmpty
                      ? SliverFillRemaining(
                          hasScrollBody: false,
                          child: HomeComponent(articles: articles),
                        )
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
                      onPressed: () => ref.invalidate(productsProvider),
                      child: Text(
                        tr(context).retry,
                        style: TextStyles.coloredElevatedButton(context),
                      ),
                    ),
                  ),
                ),
                loading: () => const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 160,
                    child: LoadingIndicator(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
