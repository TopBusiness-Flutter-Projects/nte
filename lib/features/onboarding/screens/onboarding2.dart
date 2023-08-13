import 'package:flutter/material.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/utils/assets_manager.dart';

class OnBoarding2 extends StatelessWidget{
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Spacer(flex: 2),
          Center(
            child: Image.asset(ImageAssets.onBoarding2Image,width: width/1.4,),
          ),
          Spacer(flex: 2,),
          Container(
            height:height/2.3 ,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft:Radius.circular(50) ,topRight: Radius.circular(50)),
                color:    AppColors.yellow2,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.yellow1,
                      AppColors.yellow2,

                    ]
                )
            ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 1,),
                const Text(
                  'المناديب الشاحنات',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.5),
                  child: Text("تقدم خدماتنا حلا شاملا لجميع احتياجات الشحن الخاص بك",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400,
                      height: 1.52,
                    ),
                  ),
                ),
                const Spacer(flex: 1,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: AppColors.blue1,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  alignment: Alignment.center,
                  width: width* 0.3,
                  height: height*0.05,
                  child: const Text("انضم الينا",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Cairo',),),
                ),
                const Spacer(flex: 2,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
