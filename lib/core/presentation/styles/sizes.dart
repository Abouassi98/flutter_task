part of 'styles.dart';

abstract class Sizes {
  static final double statusBarHeight = MediaQueryData.fromView(
    WidgetsBinding.instance.platformDispatcher.views.single,
  ).padding.top;

  static final double homeIndicatorHeight = MediaQueryData.fromView(
    WidgetsBinding.instance.platformDispatcher.views.single,
  ).viewPadding.bottom;

  static final double windowHeight = MediaQueryData.fromView(
    WidgetsBinding.instance.platformDispatcher.views.single,
  ).size.height;

  static double topPadding(BuildContext context) => MediaQuery.paddingOf(context).top;

  // Font Sizes
  /// You can use these directly if you need, but usually there should be a predefined style in TextStyles
  static const double font28 = 28;
  static const double font24 = 24;
  static const double font20 = 20;
  static const double font18 = 18;
  static const double font16 = 16;
  static const double font14 = 14;
  static const double font12 = 12;

  // Icon Sizes
  static const double icon32 = 32;
  static const double icon24 = 24;

  // Screen Padding
  static const double screenPaddingV24 = 24;
  static const double screenPaddingV16 = 16;
  static const double screenPaddingH24 = 24;
  static const double screenPaddingH16 = 16;

  // Widget Size
  static const double widgetSizeV340 = 340;
  static const double widgetSizeV253 = 253;
  static const double widgetSizeV210 = 210;
  static const double widgetSizeV170 = 170;
  static const double widgetSizeV140 = 140;
  static const double widgetSizeV135 = 135;
  static const double widgetSizeV122 = 122;
  static const double widgetSizeV115 = 115;
  static const double widgetSizeV111 = 111;
  static const double widgetSizeV100 = 100;
  static const double widgetSizeV70 = 70;
  static const double widgetSizeV50 = 50;
  static const double widgetSizeV45 = 45;
  static const double widgetSizeV40 = 40;
  static const double widgetSizeV38 = 38;
  static const double widgetSizeV24 = 24;
  static const double widgetSizeV3 = 3;
  static const double widgetSizeV7 = 7;
  static const double widgetSizeH188 = 188;
  static const double widgetSizeH123 = 123;
  static const double widgetSizeH70 = 70;
  static const double widgetSizeH47 = 47;
  static const double widgetSizeH45 = 45;
  static const double widgetSizeH38 = 38;
  static const double widgetSizeH13 = 13;
  static const double widgetSizeH7 = 7;
  //Widget Radius
  static const double widgetRadius30 = 30;
  static const double widgetRadius25 = 25;
  static const double widgetRadius20 = 20;
  static const double widgetRadius15 = 15;
  static const double widgetRadius10 = 10;
  static const double widgetRadius8 = 8;
  static const double widgetRadius5 = 5;
  // Widget Margin
  static const double marginV28 = 28;
  static const double marginV20 = 20;
  static const double marginV18 = 18;
  static const double marginV16 = 16;
  static const double marginV14 = 14;
  static const double marginV12 = 12;
  static const double marginV11 = 11;
  static const double marginV10 = 10;
  static const double marginV9 = 9;
  static const double marginV8 = 8;
  static const double marginV7 = 7;
  static const double marginV4 = 4;
  static const double marginV2 = 2;
  static const double marginH28 = 28;
  static const double marginH20 = 20;
  static const double marginH17 = 17;
  static const double marginH16 = 16;
  static const double marginH12 = 12;
  static const double marginH10 = 10;
  static const double marginH9 = 9;
  static const double marginH8 = 8;
  static const double marginH7 = 7;
  static const double marginH6 = 6;
  static const double marginH5 = 5;
  static const double marginH2 = 2;

  // Widget Padding
  static const double paddingV70 = 70;
  static const double paddingV30 = 30;
  static const double paddingV14 = 14;
  static const double paddingV10 = 10;
  static const double paddingH32 = 32;
  static const double paddingH20 = 20;
  static const double paddingH16 = 16;
  static const double paddingH10 = 10;
  static const double paddingH7 = 7;

  // Widget Constraints
  static const double maxWidth360 = 360;

  // Button
  static const double buttonPaddingV16 = 16;
  static const double buttonPaddingV8 = 8;
  static const double buttonPaddingV6 = 6;
  static const double buttonPaddingH96 = 96;
  static const double buttonPaddingH24 = 24;
  static const double buttonR10 = 10;
  static const double buttonR5 = 5;

  // Dialog
  static const double dialogWidth280 = 280;
  static const double dialogR20 = 20;
  static const double dialogR6 = 4;
  static const double dialogPaddingV36 = 36;
  static const double dialogPaddingV28 = 28;
  static const double dialogPaddingV20 = 20;
  static const double dialogPaddingH24 = 24;

  // Home
  static const double appBarHeight60 = 60;
  static const double appBarLeadingWidth = 68;
  static const double appBarButtonR32 = 32;
  static const double appBarElevation = 0;
  static const double drawerWidth280 = 320;
  static const double drawerPaddingV88 = 88;
  static const double drawerPaddingH40 = 40;
  static const double navBarElevation = 2;
  static const double homeAlbumImageHight = 116;
  static const double homeAlbumImageWidth = 116;
  static const double homeAlbumImageRadius = 5;

  // HomeShell
  static const double appBarHeight56 = 56;
  static const double drawerWidth240 = 240;
  static const double drawerPaddingH28 = 28;
  static const double navBarHeight60 = 60;
  static const double navBarIconR22 = 22;
}
