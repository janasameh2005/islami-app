import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/home_screen.dart';

class OnboardingScreenItems extends StatelessWidget {
  PageController pageController=PageController();
  int currentIndex=0;
  String imageUrl;
  String title;
  String subTitle;
  OnboardingScreenItems({required this.imageUrl,required this.title,required this.subTitle});
  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.sizeOf(context).width;
    double screenHeight=MediaQuery.sizeOf(context).height;
    return Column(children: [
      Image.asset('assets/images/header.png',width:screenWidth*0.8,),
      SizedBox(height: screenHeight*0.06,),
     Align(
       alignment: Alignment.center,
       child: Image.asset('assets/images/$imageUrl.png',) ,),
      SizedBox(height: screenHeight*0.02,),
      Text(title,style: TextStyle(color:AppTheme.primary,fontSize: 20,fontWeight: FontWeight.bold),),
      SizedBox(height: screenHeight*0.02,),
      Expanded(child: Text(subTitle,style: TextStyle(color:AppTheme.primary,fontSize: 16,fontWeight: FontWeight.bold),)),

    ],);
  }
}
