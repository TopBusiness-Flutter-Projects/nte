import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:nte/core/utils/getsize.dart';
import 'package:nte/features/orderdetails/cubit/cubit.dart';
import 'package:nte/features/orderdetails/cubit/state.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/dialogs.dart';
import '../../../core/widgets/my_svg_widget.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class AddPageSecond extends StatefulWidget {
  bool isEdit;
  AddPageSecond({this.isEdit = false, super.key});

  @override
  State<AddPageSecond> createState() => _AddPageSecondState();
}

class _AddPageSecondState extends State<AddPageSecond> {
  void showBottomSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(getSize(context) / 22),
          topRight: Radius.circular(getSize(context) / 22),
        ),
      ),
      context: context,
      builder: (context) {
        return Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: MySvgWidget(
                      path: ImageAssets.closeIcon,
                      imageColor: AppColors.red,
                      size: getSize(context) / 22)),
            ),
            Flexible(
              child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Container(
                        padding: EdgeInsets.all(getSize(context) / 22),
                        child: Html(
                          shrinkWrap: true,
                          data: context
                              .read<AddNewOrderCubit>()
                              .conditions!
                              .conditions,
                        )),
                  ]),
            )
          ],
        );
      },
    );
  }

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isLoadingEdit = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
      builder: (context, state) {
        return BlocConsumer<AddNewOrderCubit, AddNewOrderState>(
          listener: (context, state) {
            if (state is LoadingEditOrder) {
              isLoadingEdit = true;
            } else {
              if (state is LoadingAddNewOrder) {
                isLoading = true;
              } else {
                isLoading = false;
                isLoadingEdit = false;
              }
            }
          },
          builder: (context, state) {
            AddNewOrderCubit cubit = context.read<AddNewOrderCubit>();
            return Container(
              padding: EdgeInsets.only(
                left: getSize(context) / 22,
                right: getSize(context) / 22,
              ),
              color: AppColors.sheetColor,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            onPressed: () {
                              cubit.navigateToFirstTab(); //
                            },
                            icon: const Icon(Icons.arrow_back)),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: getSize(context) / 3,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      getSize(context) / 32),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: InkWell(
                                onTap: () async {
                                  await cubit.pickImage();
                                },

                                ///true>> image : false >>column
                                child: cubit.imageEdit != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            getSize(context) / 32),
                                        child: Image.network(
                                          cubit.imageEdit!,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : cubit.imageFile != null
                                        ? ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                getSize(context) / 32),
                                            child: Image.file(
                                              cubit.imageFile!,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              MySvgWidget(
                                                  path: ImageAssets.uploadImage,
                                                  imageColor: AppColors.primary,
                                                  size: getSize(context) / 10),
                                              Text(
                                                'add_image'.tr(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: AppColors.primary,
                                                  fontSize:
                                                      getSize(context) / 28,
                                                  fontFamily: 'Cairo',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )
                                            ],
                                          ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: getSize(context) / 32,
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: getSize(context) / 3,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: getSize(context) / 100,
                                  horizontal: getSize(context) / 32),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      MySvgWidget(
                                          path: ImageAssets.desc,
                                          imageColor: AppColors.primary,
                                          size: getSize(context) / 16),
                                      SizedBox(width: getSize(context) / 44),
                                      Flexible(
                                        child: Text(
                                          'description'.tr(),
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: getSize(context) / 24,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  TextFormField(
                                    style: TextStyle(
                                        fontSize: getSize(context) / 28,
                                        fontFamily: 'Cairo'),
                                    controller: cubit.descOfTuckController,
                                    maxLines: 3,
                                    minLines: 2,
                                    validator: (value) {
                                      if (value == null) {
                                        return 'desc_msg'.tr();
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'desc_des'.tr(),
                                      hintStyle: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: getSize(context) / 28,
                                        fontFamily: 'Cairo',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: cubit.checkBox,
                            checkColor: AppColors.white,
                            focusColor: AppColors.primary,
                            activeColor: AppColors.primary,
                            hoverColor: AppColors.white,
                            onChanged: (value) {
                              cubit.changeCheckBox();
                            },
                          ),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                showBottomSheet();
                              },
                              child: SizedBox(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'accept_on'.tr(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: getSize(context) / 28,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'accept_on_2'.tr(),
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: getSize(context) / 28,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'accept_on_3'.tr(),
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: getSize(context) / 28,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      widget.isEdit
                          ? Padding(
                              padding:
                                  EdgeInsets.only(top: getSize(context) / 44),
                              child: CustomButton(
                                  width: getSize(context) / 1.4,
                                  text: 'save_edit'.tr(),
                                  color: AppColors.primary,
                                  borderRadius: getSize(context) / 22,
                                  paddingHorizontal: 0,
                                  isLoading: isLoadingEdit,
                                  onClick: () {
                                    if (formKey.currentState!.validate()) {
                                      if (cubit.checkBox) {
                                        cubit.editOrder(
                                          context: context,
                                        );
                                      } else {
                                        errorGetBar('please accept condition');
                                      }
                                    } else {}

                                    ///validate and got to next screen
                                  }),
                            )
                          : Padding(
                              padding:
                                  EdgeInsets.only(top: getSize(context) / 44),
                              child: CustomButton(
                                  width: getSize(context) / 1.4,
                                  text: 'add_new_order'.tr(),
                                  color: AppColors.primary,
                                  borderRadius: getSize(context) / 22,
                                  paddingHorizontal: 0,
                                  isLoading: isLoading,
                                  onClick: () {
                                    if (formKey.currentState!.validate()) {
                                      if (cubit.imageFile != null) {
                                        if (cubit.checkBox) {
                                          cubit.addNewOrder(context);
                                        } else {
                                          errorGetBar('accept_terms'.tr());
                                        }
                                      } else {
                                        errorGetBar('please_add_images'.tr());
                                      }
                                    } else {}

                                    ///validate and got to next screen
                                  }),
                            )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
