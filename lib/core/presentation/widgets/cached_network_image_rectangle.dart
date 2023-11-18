import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../../gen/my_assets.dart';
import '../../infrastructure/services/cache_service.dart';

import '../styles/styles.dart';
import '../utils/riverpod_framework.dart';

class CachedNetworkImageRectangle extends ConsumerWidget {
  const CachedNetworkImageRectangle({
    required this.imageUrl,
    this.spareImageUrl = '', // TODO(Abouassi): Add spare image from backend.
    this.maxHeightDiskCache = 115,
    this.maxWidthDiskCache = 121,
    super.key,
  });
  final String? imageUrl;
  final String spareImageUrl;

  final double? maxHeightDiskCache;
  final double? maxWidthDiskCache;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cacheService = ref.watch(cacheServiceProvider);

    return CachedNetworkImage(
      key: UniqueKey(),
      cacheManager: cacheService.customCacheManager,
      imageUrl: imageUrl != null && imageUrl!.contains('http')
          ? imageUrl!
          : spareImageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: maxHeightDiskCache,
        width: maxWidthDiskCache,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(Sizes.buttonR5),
            topRight: Radius.circular(Sizes.buttonR5),
          ),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        height: maxHeightDiskCache,
        width: maxWidthDiskCache,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(MyAssets.ASSETS_IMAGES_CORE_LOADING_GIF),
            fit: BoxFit.cover,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: maxHeightDiskCache,
        width: maxWidthDiskCache,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(MyAssets.ASSETS_IMAGES_CORE_NO_INTERNET_JPG),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
