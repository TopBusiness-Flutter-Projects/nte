import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/widgets/custom_button.dart';
import 'package:nte/core/widgets/custom_textfield.dart';
import 'package:nte/features/editprofile/cubit/cubit.dart';
import 'package:nte/features/editprofile/cubit/state.dart';
import '../../../core/models/city_model.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/customappbar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    //
    context
        .read<EditProfileCubit>()
        .getCities()
        .then((value) => context.read<EditProfileCubit>().getProfile());
    ;

    super.initState();
  }

  bool isLoading = true;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoadingUpdate = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is LoadingUpdateProfile) {
          isLoadingUpdate = true;
        } else {
          isLoadingUpdate = false;
          if (state is LoadingGetProfile ||
              state is LoadedGetCities ||
              state is LoadingGetCities) {
            isLoading = true;
          } else {
            isLoading = false;
          }
        }

        //////
      },
      builder: (context, state) {
        var controller = context.read<EditProfileCubit>();
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.secondPrimary2,
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    height: getSize(context) / 3.2,
                    width: double.infinity,
                    color: AppColors.blue1,
                    child: CustomAppBar(isEditProfile: true),
                  ),
                  SizedBox(height: getSize(context) / 66),
                  isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        )
                      : Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(getSize(context) / 22),
                                    topRight: Radius.circular(
                                        getSize(context) / 22))),
                            child: ListView(
                              children: [
                                SizedBox(height: getSize(context) / 66),
                                CircleAvatar(
                                  radius: getSize(context) / 10.5,
                                  backgroundColor: AppColors.red,
                                  child: Material(
                                    elevation: 10,
                                    borderRadius: BorderRadius.circular(
                                        getSize(context) / 2),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: getSize(context) / 10,
                                          backgroundColor: AppColors.primary,
                                          child: ClipOval(
                                              child: controller.imageFile !=
                                                      null
                                                  ? Image.file(
                                                      controller.imageFile!,
                                                      fit: BoxFit.cover,
                                                      width:
                                                          getSize(context) / 5,
                                                      height:
                                                          getSize(context) / 5,
                                                    )
                                                  : Image.network(
                                                      controller
                                                          .profileData!.image,
                                                      fit: BoxFit.cover,
                                                      width:
                                                          getSize(context) / 5,
                                                      height:
                                                          getSize(context) / 5,
                                                    )),
                                        ),
                                        CircleAvatar(
                                          radius: getSize(context) / 10,
                                          backgroundColor: AppColors.blackLite
                                              .withOpacity(0.3),
                                          child: IconButton(
                                            alignment: Alignment.center,
                                            icon: const Icon(Icons.camera_alt),
                                            onPressed: () {
                                              controller.pickImage();
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: getSize(context) / 66),
                                CustomTextField(
                                  title: 'fullname'.tr(),
                                  textInputType: TextInputType.name,
                                  backgroundColor: AppColors.white,
                                  prefixWidget:
                                      const Icon(CupertinoIcons.person),
                                  validatorMessage: 'fullname_msg'.tr(),
                                  controller: controller.fullNameController,
                                ),
                                SizedBox(height: getSize(context) / 30),
                                CustomTextField(
                                  title: 'phone'.tr(),
                                  textInputType: TextInputType.phone,
                                  backgroundColor: AppColors.white,
                                  prefixWidget:
                                      const Icon(CupertinoIcons.phone),
                                  validatorMessage: 'phone_msg'.tr(),
                                  controller: controller.phoneNumberController,
                                ),
                                SizedBox(height: getSize(context) / 30),
                                CustomTextField(
                                  title: 'email'.tr(),
                                  textInputType: TextInputType.emailAddress,
                                  backgroundColor: AppColors.white,
                                  prefixWidget: const Icon(CupertinoIcons.mail),
                                  validatorMessage: 'email_msg'.tr(),
                                  controller: controller.emailController,
                                ),
                                SizedBox(height: getSize(context) / 30),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: getSize(context) / 22),
                                  child: DropdownButtonFormField2<CityData>(
                                    isExpanded: true,
                                    autofocus: false,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Cairo',
                                        color: AppColors.black),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: getSize(context) / 44,
                                          horizontal: getSize(context) / 44),
                                      hintText: 'city'.tr(),
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Cairo',
                                        color: AppColors.gray6,
                                      ),
                                      helperStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Cairo',
                                        color: AppColors.gray6,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            getSize(context) / 22),
                                        borderSide: BorderSide(
                                            color: AppColors.buttonColor),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            getSize(context) / 22),
                                        borderSide: BorderSide(
                                            color: AppColors.buttonColor),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            getSize(context) / 22),
                                        borderSide: BorderSide(
                                            color: AppColors.buttonColor),
                                      ),
                                      prefixIcon:
                                          const Icon(Icons.home_outlined),
                                      suffixIconColor: AppColors.buttonColor,
                                      prefixIconColor: AppColors.buttonColor,
                                      fillColor: AppColors.white,
                                      filled: true,
                                    ),
                                    value: controller.cities
                                            .contains(controller.city)
                                        ? controller.city
                                        : null,
                                    alignment: Alignment.center,
                                    items: controller.cities
                                        .map((item) =>
                                            DropdownMenuItem<CityData>(
                                              value: item,
                                              child: Text(
                                                item.name,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                        getSize(context) / 22),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'city_msg'.tr();
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      controller.city = value;
                                      controller.selectedValue = value!.id;
                                    },
                                    onSaved: (value) {
                                      controller.city = value;
                                      controller.selectedValue = value!.id;
                                    },
                                    buttonStyleData: const ButtonStyleData(
                                      padding: EdgeInsets.only(right: 8),
                                    ),
                                    iconStyleData: IconStyleData(
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: AppColors.buttonColor,
                                      ),
                                      iconSize: getSize(context) / 12,
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                    ),
                                  ),
                                ),
                                SizedBox(height: getSize(context) / 12),
                                CustomButton(
                                    isLoading: isLoadingUpdate,
                                    paddingHorizontal: getSize(context) / 6,
                                    text: 'update_account'.tr(),
                                    color: AppColors.primary,
                                    borderRadius: getSize(context) / 22,
                                    onClick: () {
                                      if (formKey.currentState!.validate()) {
                                        print('updated');
                                        controller.updateProfile(context);
                                      } else {}
                                    })
                              ],
                            ),
                          ),
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
