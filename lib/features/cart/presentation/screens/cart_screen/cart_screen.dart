// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../../../../core/core_features/theme/presentation/utils/custom_colors.dart';
// import '../../../../../core/presentation/styles/styles.dart';
// import '../../../../../gen/my_assets.dart';
// import '../../components/cart_card.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: Sizes.paddingH16,
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               //height: Sizes.widgetSizeV50,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(
//                   Sizes.widgetRadius5,
//                 ), // Adjust the radius as needed
//                 color: customColors(context).whiteColor,
//               ),
//               padding: const EdgeInsets.symmetric(
//                 horizontal: Sizes.paddingH10,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Text(
//                         '(352)',
//                         style: TextStyles.blueBoldF14(context),
//                       ),
//                       const SizedBox(
//                         width: Sizes.marginH5,
//                       ),
//                       Text(
//                         'عنصر',
//                         style: TextStyles.blackMediumF14(context),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         'الإجمالي',
//                         style: TextStyles.blueBoldF14(context),
//                       ),
//                       const SizedBox(
//                         width: Sizes.marginH7,
//                       ),
//                       Text(
//                         '70,048',
//                         style: TextStyles.blackMediumF14(context),
//                       ),
//                       const SizedBox(
//                         width: Sizes.marginH6,
//                       ),
//                       Text(
//                         'ج.م',
//                         style: TextStyles.blackMediumF12(context),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const CartCard(),
//             const SizedBox(
//               height: Sizes.marginH20,
//             ),
//             Expanded(
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       SvgPicture.asset(
//                         MyAssets.ASSETS_IMAGES_CORE_CART_SLIDER_SVG,
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: Sizes.paddingV10,
//                       //   horizontal: Sizes.paddingH10,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding:
//                               const EdgeInsets.only(right: Sizes.paddingH20),
//                           child: Text(
//                             'هل تمتلك كوبون للخصم ؟',
//                             style: TextStyles.whiteBoldF16(context),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: Sizes.marginH20,
//                         ),
//                         Row(
//                           children: [
//                             ElevatedButton(
//                               onPressed: () {
//                                 // Handle button 1 click
//                               },
//                               child: Text(
//                                 'أدخل رقم الكوبون',
//                                 style: TextStyles.whiteMediumF24(context),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: Sizes.marginH16,
//                             ), // Adjust the space between buttons
//                             ElevatedButton(
//                               onPressed: () {
//                                 // Handle button 2 click
//                               },
//                               child: const Text('تطبيق'),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: Sizes.widgetSizeV122,
//               padding: const EdgeInsets.only(
//                 left: Sizes.paddingH10,
//                 right: Sizes.paddingH10,
//                 top: Sizes.paddingV10,
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(
//                   Sizes.widgetRadius5,
//                 ), // Adjust the radius as needed
//                 color: customColors(context).whiteColor,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'الإجمالي',
//                         style: TextStyles.blueBoldF14(context),
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             '70,048',
//                             style: TextStyles.blackMediumF14(context),
//                           ),
//                           const SizedBox(
//                             width: Sizes.marginH6,
//                           ),
//                           Text(
//                             'ج.م',
//                             style: TextStyles.blackMediumF12(context),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'الضرائب',
//                         style: TextStyles.blueBoldF14(context),
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             '5.00',
//                             style: TextStyles.blackMediumF14(context),
//                           ),
//                           const SizedBox(
//                             width: Sizes.marginH6,
//                           ),
//                           Text(
//                             'ج.م',
//                             style: TextStyles.blackMediumF12(context),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const Divider(
//                     color: Colors.black,
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Add your button action here
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: customColors(context)
//                                 .blueColor, // Set the background color
//                           ),
//                           child: Text(
//                             'إتمام الشراء',
//                             style: TextStyles.whiteBoldF16(context),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
