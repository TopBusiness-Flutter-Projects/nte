import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/config/routes/app_routes.dart';
import 'package:nte/core/models/login_model.dart';
import 'package:nte/core/preferences/preferences.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/utils/assets_manager.dart';
import 'package:nte/core/utils/getsize.dart';
import 'package:nte/core/widgets/my_svg_widget.dart';
import 'package:nte/features/homescreen/cubit/cubit.dart';
import 'package:nte/features/homescreen_driver/cubit/homecubit.dart';
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
  LoginModel? user;
  @override
  void initState() {
    Preferences.instance.getUserModel().then((value) {
      user = value;
    });
    context.read<ProfileCubit>().getProfile();
    super.initState();
  }

  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    String lang = EasyLocalization.of(context)!.currentLocale!.languageCode;
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
              body: isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    )
                  : cubit.profileData == null
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                          ),
                        )
                      : ListView(shrinkWrap: true, children: [
                          Container(
                            height: getSize(context) / 3.2,
                            width: double.infinity,
                            color: AppColors.blue1,
                            child: CustomAppBar(isHome: true, isProfile: true),
                          ),
                          SizedBox(height: getSize(context) / 66),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: getSize(context) / 7.5,
                                margin:
                                    EdgeInsets.only(top: getSize(context) / 9),
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                          getSize(context) / 22),
                                      topRight: Radius.circular(
                                          getSize(context) / 22),
                                    )),
                              ),
                              Positioned(
                                top: -getSize(context) / 300,
                                child: Padding(
                                  padding:
                                      EdgeInsets.all(getSize(context) / 100),
                                  child: Material(
                                    elevation: 5,
                                    borderRadius:
                                        BorderRadius.circular(getSize(context)),
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.white,
                                      radius: getSize(context) / 9,
                                      child: ClipOval(
                                          child: Image.network(
                                        cubit.profileData!.image,
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: MySvgWidget(
                                                imageColor: AppColors.primary,
                                                path: ImageAssets.trunckIcon,
                                                size: getSize(context) / 1),
                                          );
                                        },
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
                          Container(
                            color: AppColors.white,
                            height: (user!.data!.type == 'user' &&
                                    user!.data!.userType != null)
                                ? MediaQuery.of(context).size.height / 1.2
                                : MediaQuery.of(context).size.height / 1.5,
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
                                (user!.data!.type == 'user' &&
                                        user!.data!.userType != null)
                                    ? Container()
                                    : InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(context,
                                              Routes.changePasswordDriver);
                                        },
                                        child: ClientProfileItem(
                                          isString: false,
                                          icon: MySvgWidget(
                                              path: ImageAssets.password,
                                              imageColor: AppColors.primary,
                                              size: getSize(context) / 18),
                                          title: 'change_pass'.tr(),
                                          onPressed: () {
                                            ///
                                          },
                                        ),
                                      ),
                                (user!.data!.type == 'user' &&
                                        user!.data!.userType != null)
                                    ? InkWell(
                                        onTap: () {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pushNamed(
                                                  Routes.editProfileScreen);
                                        },
                                        child: ClientProfileItem(
                                          isString: false,
                                          icon: MySvgWidget(
                                              path: ImageAssets.editIcon,
                                              imageColor: AppColors.primary,
                                              size: getSize(context) / 18),
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pushNamed(
                                                    Routes.editProfileScreen);
                                          },
                                          title: 'edit_account'.tr(),
                                        ),
                                      )
                                    : Container(),
                                (user!.data!.type == 'user' &&
                                        user!.data!.userType != null)
                                    ? InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .all(Radius.circular(
                                                            getSize(context) /
                                                                32))),
                                                title: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    'delete_account'.tr(),
                                                    style: TextStyle(
                                                      color: AppColors.primary,
                                                      fontSize:
                                                          getSize(context) / 22,
                                                      fontFamily: 'Cairo',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                content: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: <Widget>[
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          'sure_delete'.tr(),
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .primary,
                                                            fontSize: getSize(
                                                                    context) /
                                                                24,
                                                            fontFamily: 'Cairo',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                actionsAlignment:
                                                    MainAxisAlignment.center,
                                                actions: <Widget>[
                                                  InkWell(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets.symmetric(
                                                            horizontal: getSize(
                                                                    context) /
                                                                22),
                                                        alignment:
                                                            Alignment.center,
                                                        width:
                                                            getSize(context) /
                                                                4,
                                                        height:
                                                            getSize(context) /
                                                                10,
                                                        decoration:
                                                            ShapeDecoration(
                                                          color:
                                                              AppColors.primary,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        getSize(context) /
                                                                            32),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          'no'.tr(),
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: getSize(
                                                                    context) /
                                                                22,
                                                            fontFamily: 'Cairo',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      )),
                                                  InkWell(
                                                      onTap: () {
                                                        cubit.deleteAccount(
                                                            context);
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets.symmetric(
                                                            horizontal: getSize(
                                                                    context) /
                                                                22),
                                                        alignment:
                                                            Alignment.center,
                                                        width:
                                                            getSize(context) /
                                                                4,
                                                        height:
                                                            getSize(context) /
                                                                10,
                                                        decoration:
                                                            ShapeDecoration(
                                                          color: AppColors
                                                              .secondPrimary2,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        getSize(context) /
                                                                            32),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          'yes'.tr(),
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: getSize(
                                                                    context) /
                                                                22,
                                                            fontFamily: 'Cairo',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      )),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: ClientProfileItem(
                                            isString: false,
                                            icon: Icon(
                                              CupertinoIcons.delete,
                                              size: getSize(context) / 16,
                                              color: AppColors.redColor,
                                            ),
                                            onPressed: () {},
                                            title: 'delete_account'.tr()),
                                      )
                                    : Container(),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        Routes.loginRoute,
                                        (Route<dynamic> route) => false);
                                    context.read<HomeCubit>().selectedIndex = 0;
                                    context
                                        .read<HomeDriverCubit>()
                                        .selectedIndex = 0;
                                    Preferences.instance.clearAllData();
                                  },
                                  child: ClientProfileItem(
                                    isString: false,
                                    icon: Transform.flip(
                                      flipX: lang == 'ar' ? true : false,
                                      child: Icon(
                                        Icons.logout_outlined,
                                        color: AppColors.primary,
                                        size: getSize(context) / 16,
                                      ),
                                    ),
                                    title: 'log_out'.tr(),
                                    onPressed: () {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          Routes.loginRoute,
                                          (Route<dynamic> route) => false);
                                      context.read<HomeCubit>().selectedIndex =
                                          0;
                                      context
                                          .read<HomeDriverCubit>()
                                          .selectedIndex = 0;
                                      Preferences.instance.clearAllData();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ])),
        );
      },
    );
  }
}
