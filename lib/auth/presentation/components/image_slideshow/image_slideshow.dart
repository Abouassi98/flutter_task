import 'dart:async';

import 'package:flutter/material.dart';

part 'indicator.dart';

class ImageSlideshow extends StatefulWidget {
  const ImageSlideshow({
    required this.children,
    this.width = double.infinity,
    this.height = 200,
    this.initialIndex = 0,
    this.indicatorActiveColor,
    this.indicatorInactiveColor = Colors.grey,
    this.onPageChanged,
    this.autoPlayInterval,
    this.isLoop = false,
    this.indicatorHeight = 3.5,
    this.indicatorWidth = 20,
    this.indicatorPadding = 16,
    this.indicatorBottomPadding = 8,
    this.disableUserScrolling = false,
    super.key,
  });

  /// The widgets to display in the [ImageSlideshow].
  ///
  /// Mainly intended for image widget, but other widgets can also be used.
  final List<Widget> children;

  /// Width of the [ImageSlideshow].
  final double width;

  /// Height of the [ImageSlideshow].
  final double height;

  /// The image to show when first creating the [ImageSlideshow].
  final int initialIndex;

  /// The color of the active the indicator.
  final Color? indicatorActiveColor;

  /// The color of the inactive indicator.
  final Color? indicatorInactiveColor;

  /// Called whenever the page in the center of the viewport changes.
  final ValueChanged<int>? onPageChanged;

  /// Auto scroll interval.
  ///
  /// Do not auto scroll when you enter null or 0.
  final int? autoPlayInterval;

  /// Loops back to first slide.
  final bool isLoop;

  /// Height of CircleIndicator.
  final double indicatorHeight;

  /// Width of CircleIndicator.
  final double indicatorWidth;

  /// Padding of CircleIndicator.
  final double indicatorPadding;

  /// BottomPadding to Indicator.
  final double indicatorBottomPadding;

  /// Disable page changes by the user.
  final bool disableUserScrolling;

  @override
  ImageSlideshowState createState() => ImageSlideshowState();
}

class ImageSlideshowState extends State<ImageSlideshow> {
  late final ValueNotifier<int> _currentIndex;
  Timer? _timer;

  void _autoPlayTimerStart() {
    _timer?.cancel();
    _timer = Timer.periodic(
      Duration(milliseconds: widget.autoPlayInterval!),
      (timer) {
        if (_currentIndex.value >= widget.children.length - 1) {
          if (widget.isLoop) _currentIndex.value = 0;
        } else {
          _currentIndex.value++;
        }
      },
    );
  }

  void stopAutoPlay() {
    _timer?.cancel();
  }

  @override
  void initState() {
    _currentIndex = ValueNotifier(widget.initialIndex);
    if (widget.autoPlayInterval != null && widget.autoPlayInterval != 0) {
      _autoPlayTimerStart();
    }
    super.initState();
  }

  @override
  void dispose() {
    _currentIndex.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ValueListenableBuilder<int>(
        valueListenable: _currentIndex,
        builder: (context, value, child) {
          return Stack(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: widget.children[value],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: widget.indicatorBottomPadding,
                child: Indicator(
                  count: widget.children.length,
                  currentIndex: value % widget.children.length,
                  activeColor: widget.indicatorActiveColor,
                  inactiveColor: widget.indicatorInactiveColor,
                  height: widget.indicatorHeight,
                  width: widget.indicatorWidth,
                  padding: widget.indicatorPadding,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
