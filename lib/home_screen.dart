import 'package:flutter/material.dart';
import 'package:islami_app/nav_bar_selected_icon.dart';
import 'package:islami_app/nav_bar_unselected_icon.dart';
import 'package:islami_app/tabs/hadeth_tab.dart';
import 'package:islami_app/tabs/quran_tab.dart';
import 'package:islami_app/tabs/radio_tab.dart';
import 'package:islami_app/tabs/sebha_tab.dart';
import 'package:islami_app/tabs/time_tab.dart';

class HomeScreen extends StatefulWidget {
static const String routeName='/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int currentIndex=0;

List<Widget>tabs=[
  QuranTab(),
  HadethTab(),
  SebhaTab(),
 RadioTab(),
  TimeTab()
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex:currentIndex,
          onTap: (index){
            if(currentIndex==index)return;
            currentIndex=index;
            setState(() {

                        });
          },
          items:[
        BottomNavigationBarItem(icon: NavBarUnselectedIcon(imageName:
          'quran'
          ,),activeIcon:NavBarSelectedIcon(imageName: 'quran',),label:'Quran'),
        BottomNavigationBarItem(icon: NavBarUnselectedIcon(imageName:
        'hadeth'
          ,),activeIcon:NavBarSelectedIcon(imageName: 'hadeth',),label:'Hadeth'),
        BottomNavigationBarItem(icon: NavBarUnselectedIcon(imageName:
        'sebha'
          ,),activeIcon:NavBarSelectedIcon(imageName: 'sebha',),label:'Sebha',),
        BottomNavigationBarItem(icon: NavBarUnselectedIcon(imageName:
        'radio'
          ,),activeIcon:NavBarSelectedIcon(imageName: 'radio',),label:'Radio'),
        BottomNavigationBarItem(icon: NavBarUnselectedIcon(imageName:
        'time'
          ,),activeIcon:NavBarSelectedIcon(imageName: 'time',),label:'Time')
      ]
    ));
  }
}
