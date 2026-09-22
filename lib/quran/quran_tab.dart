import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/quran/quran_service.dart';
import 'package:islami_app/quran/sura_item.dart';
class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    TextTheme textTheme=Theme.of(context).textTheme;
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
   children: [
     Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20),
       child: TextField(
         decoration: InputDecoration(
           hintText: 'Sura Name',
           prefixIcon:SvgPicture.asset('assets/icons/quran.svg',
             colorFilter: ColorFilter.mode(AppTheme.primary,BlendMode.srcIn),
           width: 28,
             height: 28,
             fit: BoxFit.scaleDown,
           ) ,
         ),
         cursorColor: AppTheme.primary,
         style:textTheme.titleMedium,
         onChanged: (value){
QuranService.searchSura(value);
setState(() {});
         },
       ),
     ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Text('Sura List',style: Theme.of(context).textTheme.titleMedium ,),
      ),
      Expanded(child: ListView.separated(itemBuilder: (_,index)=>SuraItem(QuranService.suraSearchResult[index]),
        itemCount: QuranService.suraSearchResult.length,padding: EdgeInsets.symmetric(horizontal: 20), separatorBuilder: (BuildContext context, int index)=>Divider(thickness: 1,color: AppTheme.white,
          endIndent: screenWidth*0.15,indent: screenWidth*0.15,
          )),)
    ],);
  }
}
