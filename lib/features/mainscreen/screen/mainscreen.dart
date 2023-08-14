import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/utils/assets_manager.dart';
import 'package:nte/core/utils/getsize.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.buttonColor,
          body: Column(
            children: [
              Container(
                height: getSize(context) / 4.5,
                width: double.infinity,
                color: AppColors.blue1,
              ),
              Flexible(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Flexible(
                      child: Container(
                          margin: EdgeInsets.only(top: getSize(context) / 12),
                          alignment: Alignment.center,
                          color: AppColors.white,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(getSize(context) / 88),
                                height: getSize(context) / 4.5,
                                color: AppColors.white,
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  children: [
                                    Text(
                                      'order_list'.tr(),
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: AppColors.buttonColor,
                                        fontSize: 20,
                                        fontFamily: 'Cairo',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          ImageAssets.filterImage,
                                        ))
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(
                                          getSize(context) / 22)),
                                  child: ListView.builder(
                                    itemCount: 50,
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.all(
                                            getSize(context) / 44),
                                        width: 380,
                                        height: 138,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          shadows: const [
                                            BoxShadow(
                                              color: Color(0x3F000000),
                                              blurRadius: 5,
                                              offset: Offset(0, 0),
                                              spreadRadius: 0,
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                padding: EdgeInsets.all(
                                                    getSize(context) / 44),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                        child: Image.asset(
                                                            'assets/images/onboarding1.png')),
                                                    Expanded(
                                                        flex: 3,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Flexible(
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                      Icons
                                                                          .date_range,
                                                                      color: AppColors
                                                                          .primary),
                                                                  Text(
                                                                    'يوم النقل',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .right,
                                                                    style:
                                                                        TextStyle(
                                                                      color: AppColors
                                                                          .primary,
                                                                      fontSize:
                                                                          16,
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            const Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8.0),
                                                              child: Text(
                                                                '8/3/2023',
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                                child: Row(
                                              children: [
                                                SizedBox(
                                                  width: getSize(context) / 100,
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Flexible(
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.home,
                                                              color: AppColors
                                                                  .primary,
                                                            ),
                                                            Text(
                                                              'الموقع',
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: TextStyle(
                                                                color: AppColors
                                                                    .primary,
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'Cairo',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      const Text(
                                                        'الدار البيضاء',
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontFamily: 'Cairo',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: VerticalDivider(
                                                    thickness: 2,
                                                    color:
                                                        AppColors.dividerColor,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Flexible(
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.navigation,
                                                              color: AppColors
                                                                  .primary,
                                                            ),
                                                            Text(
                                                              'الوجهة',
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: TextStyle(
                                                                color: AppColors
                                                                    .primary,
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'Cairo',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      const Text(
                                                        'الدار البيضاء',
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontFamily: 'Cairo',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ))
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Positioned(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(getSize(context) / 22)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        alignment: Alignment.center,
                        width: getSize(context) / 1.6,
                        height: getSize(context) / 6,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
