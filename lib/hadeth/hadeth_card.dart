import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/hadeth/hadeth_model.dart';
import 'package:islami_app/quran/sura_details_screen.dart';

class HadethCard extends StatelessWidget {
  final String title;
  final String content;

   HadethCard({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(HadethDetailsScreen.routeName,arguments:HadethModel(title: title,content: content)
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/hadethcardbackground1.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),

            Padding(
              padding:  EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/hadeth_header_left.png', width: screenWidth*0.2),
                      Expanded(
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style:  TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.black,
                          ),
                        ),
                      ),
                      Image.asset('assets/images/hadeth_header_right.png', width: screenWidth*0.2)
                    ],
                  ),
                   SizedBox(height: 12),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        content,
                        textAlign: TextAlign.center,
                        style:  TextStyle(
                          fontSize: 15,
                          color: AppTheme.black,

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/hadeth_footer.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}