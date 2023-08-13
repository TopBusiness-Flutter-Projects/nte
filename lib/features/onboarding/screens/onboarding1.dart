import 'package:flutter/material.dart';
import 'package:nte/config/routes/app_routes.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/utils/assets_manager.dart';

class OnBoarding1 extends StatelessWidget{
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Spacer(flex: 2),
          Center(
            child: Image.asset(ImageAssets.onBoarding1Image,width: width/1.4,),
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
                Spacer(flex: 1,),
                const Text(
                  'تطبيقنا',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.5),
                  child: const Text(
                    'التطبيق الاول الذى يربط بين صاحب الشحنة واصحاب النقل داخل وخارج البلاد',
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
                Spacer(flex: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                       color: AppColors.blue1,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      alignment: Alignment.center,
                      width: width* 0.3,
                      height: height*0.05,
                      child: const Text("التالى",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Cairo',),),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, Routes.loginRoute);

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 2,color: AppColors.blue1)
                        ),
                        alignment: Alignment.center,
                        width: width* 0.3,
                        height: height*0.05,
                        child: Text("انهاء",style: TextStyle(color: AppColors.blue1,fontSize: 20,fontFamily: 'Cairo',),),
                      ),
                    ),
                  ],
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
