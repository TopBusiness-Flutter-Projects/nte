import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/config/routes/app_routes.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/utils/assets_manager.dart';
import 'package:nte/core/utils/getsize.dart';
import 'package:nte/core/widgets/my_svg_widget.dart';
import 'package:nte/features/editprofile/screen/edit_profile_screen.dart';
import 'package:nte/features/profile/cubit/cubit.dart';
import 'package:nte/features/profile/cubit/state.dart';

import '../../../core/widgets/customappbar.dart';
import '../widget/profileitem.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<ProfileCubit>().getProfile();
    super.initState();
  }

  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is LoadingGetProfile) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        var cubit = context.read<ProfileCubit>();
        return SafeArea(
          child: Scaffold(
              backgroundColor: AppColors.secondPrimary2,
              body: Column(children: [
                Container(
                  height: getSize(context) / 3.2,
                  width: double.infinity,
                  color: AppColors.blue1,
                  child: CustomAppBar(isHome: true, isProfile: true),
                ),
                SizedBox(height: getSize(context) / 66),
                isLoading
                    ? CircularProgressIndicator(
                        color: AppColors.primary,
                      )
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: getSize(context) / 7,
                            margin: EdgeInsets.only(top: getSize(context) / 9),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(getSize(context) / 22),
                                  topRight:
                                      Radius.circular(getSize(context) / 22),
                                )),
                          ),
                          Positioned(
                            top: -getSize(context) / 300,
                            child: Padding(
                              padding: EdgeInsets.all(getSize(context) / 66),
                              child: Material(
                                elevation: 10,
                                borderRadius:
                                    BorderRadius.circular(getSize(context)),
                                child: CircleAvatar(
                                  backgroundColor: AppColors.white,
                                  radius: getSize(context) / 9,
                                  child: ClipOval(
                                      child: Image.network(
                                    cubit.profileData!.image,
                                    fit: BoxFit.cover,
                                    width: getSize(context) / 5,
                                    height: getSize(context) / 5,
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                isLoading
                    ? Container()
                    : Flexible(
                        child: Container(
                          color: AppColors.white,
                          child: ListView(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: getSize(context) / 22),
                                alignment: Alignment.center,
                                child: Text(
                                  cubit.profileData!.name,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    color: Color(0xFF1E1E1E),
                                    fontSize: 16,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              ClientProfileItem(
                                desc: cubit.profileData!.phone,
                                title: 'phone_num'.tr(),
                              ),
                              ClientProfileItem(
                                desc: cubit.profileData!.email,
                                title: 'mail'.tr(),
                              ),
                              ClientProfileItem(
                                desc: cubit.profileData!.city.name,
                                title: 'city'.tr(),
                              ),
                              ClientProfileItem(
                                isString: false,
                                icon: Icon(
                                  Icons.logout_outlined,
                                  color: AppColors.primary,
                                  size: getSize(context) / 16,
                                ),
                                title: 'log_out'.tr(),
                                onPressed: () {},
                              ),
                              ClientProfileItem(
                                isString: false,
                                icon: MySvgWidget(
                                    path: ImageAssets.editIcon,
                                    imageColor: AppColors.primary,
                                    size: getSize(context) / 18),
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pushNamed(Routes.editProfileScreen);
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             EditProfileScreen()));
                                },
                                title: 'edit_account'.tr(),
                              ),
                              ClientProfileItem(
                                  isString: false,
                                  icon: Icon(
                                    CupertinoIcons.delete,
                                    size: getSize(context) / 16,
                                    color: AppColors.redColor,
                                  ),
                                  onPressed: () {},
                                  title: 'delete_account'.tr()),
                            ],
                          ),
                        ),
                      )
              ])),
        );
      },
    );
  }
}
