import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/onboarding_screen_items.dart';

import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName='/onboarding-screen';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex=0;
PageController pageController=PageController();
List<OnboardingScreenItems> items=[OnboardingScreenItems(imageUrl:'onboarding_page1' , title: 'Welcome To Islami App', subTitle: ''),
  OnboardingScreenItems(imageUrl:'onboarding_page2'  , title: 'Welcome To Islami', subTitle: 'We Are Very Excited To Have You In Our Community'),
  OnboardingScreenItems(imageUrl: 'onboarding_page3' , title: 'Reading the Quran', subTitle: 'Read, and your Lord is the Most Generous'),
  OnboardingScreenItems(imageUrl: 'onboarding_page4' , title: 'Bearish', subTitle: 'Praise the name of your Lord, the Most High'),
  OnboardingScreenItems(imageUrl: 'onboarding_page5' , title: 'Holy Quran Radio', subTitle: 'You can listen to the Holy Quran Radio through the application for free and easily')];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme=Theme.of(context).textTheme;
    double screenSize=MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: AppTheme.black,
      body:SafeArea(child: Padding(padding:EdgeInsets.symmetric(horizontal: 8,vertical: 8) ,
        child:Column(
          children: [
            Expanded(
              child: PageView.builder(
                        controller: pageController
                        ,itemBuilder:(_,index)=>items[index],
              itemCount: items.length,
                onPageChanged: (index){
              setState(() {
                currentIndex=index;
              });
                },
                    ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              currentIndex>0?TextButton(onPressed: (){
                pageController.previousPage(duration: Duration(milliseconds: 15), curve:Curves.easeInOut);
              }, child: Text('Back',style:TextStyle(fontSize:16,fontWeight:FontWeight.bold,color:AppTheme.primary),)):
              SizedBox.shrink(),
              TextButton(onPressed: (){
                if(currentIndex==4){
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                }
                else{
                  pageController.nextPage(duration: Duration(milliseconds: 15), curve: Curves.easeInOut);
                }
              }, child: Text(currentIndex==4?'Done':'Next',style: TextStyle(color:AppTheme.primary,fontSize: 16,fontWeight: FontWeight.bold),))
            ],)
          ],
        ) ,) ,));
  }
}
