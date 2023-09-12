// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:nte/core/utils/app_colors.dart';
// import 'package:nte/core/utils/getsize.dart';

// class OfferRow extends StatefulWidget {
//   const OfferRow({super.key, required this.index});
//   final int index;
//   @override
//   State<OfferRow> createState() => _OfferRowState();
// }

// class _OfferRowState extends State<OfferRow> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(getSize(context) / 32),
//       child: Material(
//           borderRadius:
//               BorderRadius.all(Radius.circular(getSize(context) / 22)),
//           color: AppColors.white,
//           elevation: 4,
//           child: Row(
//             children: [
//               Expanded(
//                   flex: 2,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(
//                           Radius.circular(getSize(context) / 22)),
//                     ),
//                     child: ClipRRect(
//                         borderRadius: BorderRadius.all(
//                             Radius.circular(getSize(context) / 22)),
//                         child: SizedBox.fromSize(
//                           // size: Size.fromRadius(((getSize(context)/22)*20)),
//                           child: Image.asset(
//                               fit: BoxFit.cover,
//                               height: MediaQuery.of(context).size.height / 6.2,
//                               'assets/images/car.png'),
//                         )),
//                   )),
//               Expanded(
//                   flex: 3,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Flexible(
//                           child: Container(
//                               alignment: Alignment.centerRight,
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: getSize(context) / 16),
//                                 child: Text(
//                                   "80 ج/س",
//                                   style: TextStyle(
//                                     color: AppColors.black,
//                                     fontSize: getSize(context) / 24,
//                                     fontWeight: FontWeight.w400,
//                                     fontFamily: 'Cairo',
//                                   ),
//                                 ),
//                               ))),
//                       Container(
//                           margin: EdgeInsets.symmetric(
//                               horizontal: getSize(context) / 12),
//                           decoration: BoxDecoration(
//                               color: widget.index % 2 == 0
//                                   ? AppColors.primary
//                                   : AppColors.redColor,
//                               borderRadius: BorderRadius.only(
//                                 topRight:
//                                     Radius.circular(getSize(context) / 22),
//                                 topLeft: Radius.circular(getSize(context) / 22),
//                               )),
//                           child: Center(
//                             child: Text(
//                               widget.index % 2 == 0
//                                   ? "wait_payment".tr()
//                                   : "pending".tr(),
//                               style: TextStyle(
//                                 color: AppColors.white,
//                                 fontSize: getSize(context) / 24,
//                                 fontWeight: FontWeight.w400,
//                                 fontFamily: 'Cairo',
//                               ),
//                             ),
//                           ))
//                     ],
//                   ))
//             ],
//           )),
//     );
//   }
// }
