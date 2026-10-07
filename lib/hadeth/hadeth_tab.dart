import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_app/hadeth/hadeth_card.dart';
import 'package:islami_app/hadeth/hadeth_model.dart';
import 'package:islami_app/loading_indicator.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  bool isLoading=true;
PageController pageController=PageController(viewportFraction: 0.8);
  List <HadethModel>allHadethList=[];

  List<String>hadethFiles=[];
@override
  void initState() {
  super.initState();
   loadHadethFile();
  }
  @override
  Widget build(BuildContext context) {
    return
      isLoading?LoadingIndicator():CarouselSlider.builder(itemBuilder: (_,int,realInt)=>HadethCard(title:allHadethList[int].title,
        content: allHadethList[int].content),
      itemCount: allHadethList.length,
      options:CarouselOptions(
        height: MediaQuery.sizeOf(context).height*0.75,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
       // enableInfiniteScroll: false,
      ),
    );
  }

  Future<void>loadHadethFile()async{
    for(int i=1;i<=50;i++){
      String fileContent=await rootBundle.loadString('assets/text/hadeth/h$i.txt');
      List<String>hadethLines=fileContent.trim().split('\n');
      String title=hadethLines[0];
      hadethLines.removeAt(0);
      String content=hadethLines.join('\n');
      allHadethList.add(HadethModel(title: title, content: content));
    }
    setState(() {
      isLoading=false;
    });
  }
}
