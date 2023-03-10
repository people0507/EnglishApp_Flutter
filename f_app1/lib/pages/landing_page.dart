
import 'package:f_app1/pages/home_page.dart';
import 'package:f_app1/values/app.assets.dart';
import 'package:f_app1/values/app_colors.dart';
import 'package:f_app1/values/app_styles.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal:16),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child:Text('Welcome to',
                style: AppStyles.h3,),
                
                )
                ),
             Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                Text(
                  'English',
                  style:AppStyles.h2.copyWith(
                    color: AppColors.blackGrey,
                    fontWeight: FontWeight.bold
                  ) ,),
                    
                  Text(
                    'Quotes"',
                    textAlign: TextAlign.right,
                    style:AppStyles.h4.copyWith(height:0.3),)
                ],),
                )
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom:147),
                  child: RawMaterialButton(
                    shape: CircleBorder(),
                    fillColor: AppColors.lighBlue,
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => HomePage()),
                          (route) => false);
                    },
                    child:Image.asset(AppAssets.rightArrow) ,
                  ),
                )
                )
          ],
        ),
      )
    );
  }
}