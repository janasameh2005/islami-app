import 'package:flutter/material.dart';
import 'package:islami_app/quran/sura.dart';

class SuraItem extends StatelessWidget {
Sura sura;
SuraItem(this.sura);
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme=Theme.of(context).textTheme;
    return Row(
      children: [
        Container(width:52,
            height: 52,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 24),
            decoration: BoxDecoration(image: DecorationImage(image:AssetImage('assets/images/sura_number_frame.png') )
            ),
            child: Text('${sura.num}',style: textTheme.titleLarge,)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(sura.englishName,style: textTheme.titleLarge,),
          Text('${sura.ayatCount} verses',style: textTheme.titleSmall,)
        ],),
Spacer(),
Text(sura.arabicName,style: textTheme.titleSmall,)
      ],
    );
  }
}
