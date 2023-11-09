part of 'styles.dart';

abstract class TextStyles {
  // This is necessary for smooth fontFamily changes when changing app language,
  // that's because the fontFamily change from the theme have a slight delay.
  static TextStyle _mainStyle(BuildContext context) => TextStyle(
        fontFamily: tr(context).fontFamily,
      );

  static TextStyle blackMediumF12(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).blackColor,
        fontSize: Sizes.font12,
        fontWeight: FontStyles.fontWeightExtraBold,
        fontFamily: 'Tajawal',
        fontFamilyFallback: const ['Tajawal-Medium'],
      );

  static TextStyle blackMediumF14(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).blackColor,
        fontSize: Sizes.font14,
        fontWeight: FontStyles.fontWeightExtraBold,
        fontFamily: 'Tajawal',
        fontFamilyFallback: const ['Tajawal-Medium'],
      );

  static TextStyle blackMediumF16(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).blackColor,
        fontSize: Sizes.font16,
        fontWeight: FontStyles.fontWeightExtraBold,
        fontFamily: 'Tajawal',
        fontFamilyFallback: const ['Tajawal-Medium'],
      );
  static TextStyle blackBoldF14(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).blackColor,
        fontSize: Sizes.font14,
        fontWeight: FontStyles.fontWeightExtraBold,
        fontFamily: 'Tajawal',
        fontFamilyFallback: const ['Tajawal-Bold'],
      );
  static TextStyle blueMediumF12(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).blueColor,
        fontSize: Sizes.font12,
        fontWeight: FontStyles.fontWeightExtraBold,
        fontFamily: 'Tajawal',
        fontFamilyFallback: const ['Tajawal-Medium'],
      );
  static TextStyle blueMediumF18(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).blueColor,
        fontSize: Sizes.font18,
        fontWeight: FontStyles.fontWeightExtraBold,
        fontFamily: 'Tajawal',
        fontFamilyFallback: const ['Tajawal-Medium'],
      );
  static TextStyle blueBoldF14(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).blueColor,
        fontSize: Sizes.font14,
        fontWeight: FontStyles.fontWeightExtraBold,
        fontFamily: 'Tajawal',
        fontFamilyFallback: const ['Tajawal-Bold'],
      );
  static TextStyle whiteBoldF16(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).whiteColor,
        fontSize: Sizes.font16,
        fontWeight: FontStyles.fontWeightExtraBold,
        fontFamily: 'Tajawal',
        fontFamilyFallback: const ['Tajawal-Bold'],
      );
  static TextStyle whiteMediumF24(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).whiteColor,
        fontSize: Sizes.font24,
        fontWeight: FontStyles.fontWeightExtraBold,
        fontFamily: 'Tajawal',
        fontFamilyFallback: const ['Tajawal-Medium'],
      );
  static TextStyle orangeBoldF14(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).orangeColor,
        fontSize: Sizes.font14,
        fontWeight: FontStyles.fontWeightExtraBold,
        fontFamily: 'Tajawal',
        fontFamilyFallback: const ['Tajawal-Bold'],
      );
  static TextStyle greyBoldF14(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).greyColor,
        fontSize: Sizes.font14,
        fontWeight: FontStyles.fontWeightExtraBold,
        fontFamily: 'Tajawal',
        fontFamilyFallback: const ['Tajawal-Bold'],
      );

  static TextStyle f20(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).font20Color,
        fontSize: Sizes.font20,
        fontWeight: FontStyles.fontWeightBold,
      );

  static TextStyle f18(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).font18Color,
        fontSize: Sizes.font18,
      );

  static TextStyle f16(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).font16Color,
        fontSize: Sizes.font16,
      );

  static TextStyle f16Bold(BuildContext context) => f16(context).copyWith(fontWeight: FontStyles.fontWeightBold);

  static TextStyle f16SemiBold(BuildContext context) =>
      f16(context).copyWith(fontWeight: FontStyles.fontWeightSemiBold);

  static TextStyle f14(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).font14Color,
        fontSize: Sizes.font14,
      );
  static TextStyle f14TextFormField(BuildContext context) => _mainStyle(context).copyWith(
        color: Theme.of(context).colorScheme.primary,
        fontSize: Sizes.font14,
      );
  static TextStyle titleMedium(Color color) => TextStyle(color: color, fontSize: Sizes.font16);

  static TextStyle inputDecorationHint(Color color) => TextStyle(color: color, fontSize: Sizes.font14);

  static TextStyle inputDecorationError(Color color) => TextStyle(color: color, fontSize: Sizes.font12);

  static TextStyle appBarTitle(BuildContext context) => f20(context).copyWith(
        color: AppStaticColors.white,
        fontWeight: FontStyles.fontWeightSemiBold,
      );

  static TextStyle navigationLabel(Color color) => TextStyle(
        color: color,
        fontSize: Sizes.font12,
        fontWeight: FontStyles.fontWeightBlack,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle coloredElevatedButton(BuildContext context) => f20(context).copyWith(
        color: AppStaticColors.white,
        fontWeight: FontStyles.fontWeightSemiBold,
      );

  static TextStyle dialogTitle(Color color) => TextStyle(
        color: color,
        fontSize: Sizes.font18,
        fontWeight: FontStyles.fontWeightBold,
      );

  static TextStyle dialogContent(Color color) => TextStyle(color: color, fontSize: Sizes.font16);

  static TextStyle dialogSuccess(BuildContext context) => f20(context).copyWith(
        color: Theme.of(context).colorScheme.primary,
      );

  static TextStyle cupertinoDialogAction(BuildContext context) => f16SemiBold(context);
}
