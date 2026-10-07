import 'package:flutter/material.dart';
import 'package:islami_app/hadeth/hadeth_model.dart';

import '../app_theme.dart';
import '../loading_indicator.dart';
class HadethDetailsScreen extends StatelessWidget {
  static const String routeName='/hadeth-details-screen';
//   String title;
// String content;
//
// HadethDetailsScreen({required this.title, required this.content});
  @override
  Widget build(BuildContext context) {
    HadethModel hadethModel=ModalRoute.of(context)!.settings.arguments as HadethModel;
    TextTheme textTheme=Theme.of(context).textTheme;
    double screenWidth=MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(title:Text(hadethModel.title),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
            child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/details_header_left.png',width:screenWidth*0.2,fit: BoxFit.fill,),
                Text(hadethModel.title,style: textTheme.headlineSmall!.copyWith(color:AppTheme.primary),),
                Image.asset('assets/images/details_header_right.png',width:screenWidth*0.2,fit: BoxFit.fill,)
              ],
            ),
          ),
          Expanded(child: hadethModel.content.isEmpty?LoadingIndicator():SingleChildScrollView(
            child: Text(
              hadethModel.content,
              textAlign: TextAlign.center,
              style: textTheme.titleMedium!.copyWith(color:AppTheme.primary)

              ),
            ),
          ),
          Image.asset('assets/images/details_footer.png')
        ],

      ),

    );
  }
}
