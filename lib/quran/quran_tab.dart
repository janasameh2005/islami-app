import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/quran/quran_service.dart';
import 'package:islami_app/quran/sura_item.dart';
class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
   children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Text('Sura List',style: Theme.of(context).textTheme.titleMedium ,),
      ),
      Expanded(child: ListView.separated(itemBuilder: (_,index)=>SuraItem(QuranService.suras[index]),
        itemCount: QuranService.suras.length,padding: EdgeInsets.symmetric(horizontal: 20), separatorBuilder: (BuildContext context, int index)=>Divider(thickness: 1,color: AppTheme.white,
          endIndent: screenWidth*0.15,indent: screenWidth*0.15,
          )),)
    ],);
  }
}
