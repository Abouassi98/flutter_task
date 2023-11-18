import 'package:flutter/material.dart';
import '../../../../../core/infrastructure/services/connection_stream_service.dart';
import '../../../../../core/presentation/extensions/future_extensions.dart';
import '../../../../../core/presentation/screens/nested_screen_scaffold.dart';
import '../../../../../core/presentation/styles/styles.dart';
import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../../core/presentation/widgets/platform_widgets/platform_refresh_indicator.dart';
import '../../../../../core/presentation/widgets/toasts.dart';
import '../../components/home_cateories_list.dart';
import '../../components/home_images_slideshow_component.dart';
import '../../components/home_screen.dart';
import '../../providers/products_by_category_id_provider.dart';

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

    return NestedScreenScaffold(
      body: PlatformRefreshIndicator(
        cacheExtent: Sizes
            .windowHeight, // Fixes disposing some home lists when keyboard opens.
        topPadding: Sizes.topPadding(context),
        onRefresh: () {
          ref.invalidate(productsByCategoryIdProvider);
          return [
            ref.read(productsByCategoryIdProvider(1).future),
            ref.read(productsByCategoryIdProvider(5).future),
          ].wait.suppressError();
        },
        slivers: const [
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: Sizes.screenPaddingV24,
            ),
            sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.marginV16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HomeImagesSlideShowComponent(),
                    SizedBox(height: Sizes.marginV16),
                    HomeCategoriesList(),
                    SizedBox(height: Sizes.marginV16),
                    HomeComponent(),
                    SizedBox(height: Sizes.marginV16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
