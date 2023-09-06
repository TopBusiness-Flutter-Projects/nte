import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/utils/getsize.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/dialogs.dart';
import '../../../core/widgets/my_svg_widget.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class AddPageSecond extends StatefulWidget {
  const AddPageSecond({super.key});

  @override
  State<AddPageSecond> createState() => _AddPageSecondState();
}

class _AddPageSecondState extends State<AddPageSecond> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewOrderCubit, AddNewOrderState>(
      listener: (context, state) {
        if (state is LoadingAddNewOrder) {
          isLoading = true;
        } else if (state is LoadedAddNewOrder) {
          isLoading = false;
        } else if (state is ErrorAddNewOrder) {
          isLoading = false;
        } else {
          isLoading = false;
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
                              borderRadius:
                                  BorderRadius.circular(getSize(context) / 32),
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
                            child: cubit.imageFile != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        getSize(context) / 32),
                                    child: Image.file(
                                      cubit.imageFile!,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                          fontSize: getSize(context) / 28,
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
                                        fontSize: getSize(context) / 22,
                                        fontFamily: 'Cairo',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              TextFormField(
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
                                    fontSize: getSize(context) / 22,
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
                            print('أوافق على الشروط والأحكام الخاصة بالشركة');
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
                  Padding(
                    padding: EdgeInsets.only(top: getSize(context) / 44),
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
                                errorGetBar('please accept condition');
                              }
                            } else {
                              errorGetBar('please select image');
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
  }
}
