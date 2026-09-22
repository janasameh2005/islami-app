import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/loading_indicator.dart';
import 'package:islami_app/quran/quran_service.dart';
import 'package:islami_app/quran/sura.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName='/Sura-details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String>ayat=[];

  late Sura sura;

  @override
  Widget build(BuildContext context) {
  sura=ModalRoute.of(context)!.settings.arguments as Sura;
 if(ayat.isEmpty){
   loadSura();}
 TextTheme textTheme=Theme.of(context).textTheme;
 double screenWidth=MediaQuery.sizeOf(context).width;
 double screenHeight=MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(title:Text(sura.englishName),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
            child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/details_header_left.png',width:screenWidth*0.3,fit: BoxFit.fill,),
                  Text(sura.arabicName,style: textTheme.headlineSmall!.copyWith(color:AppTheme.primary),),
                  Image.asset('assets/images/details_header_right.png',width:screenWidth*0.3,fit: BoxFit.fill,)
              ],
            ),
          ),
          Expanded(child: ayat.isEmpty?LoadingIndicator():ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (_,index)=>Text(ayat[index],style: textTheme.titleLarge!.copyWith(color: AppTheme.primary),
              textAlign: TextAlign.center  ,
              ),
              separatorBuilder: (_,__)=>SizedBox(height: 12),
              itemCount: ayat.length)),
          Image.asset('assets/images/details_footer.png')
        ],

      ),

    );
  }

  Future<void> loadSura() async {
   String suraFileContent = await QuranService.loadSuraFile(sura.num);
  ayat = suraFileContent.split('\n');
  setState(() {

    });
}
}
