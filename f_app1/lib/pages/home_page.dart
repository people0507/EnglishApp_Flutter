import 'package:f_app1/pages/control_page.dart';
import 'package:f_app1/values/app.assets.dart';
import 'package:f_app1/values/app_colors.dart';
import 'package:f_app1/values/app_styles.dart';
import 'package:f_app1/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key:_scaffoldKey,
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.secondColor,
        title: Text(
          "English today",
          style:
              AppStyles.h3.copyWith(color: AppColors.textColor, fontSize: 36),
        ),
        leading: InkWell(
          onTap: () {_scaffoldKey.currentState?.openDrawer();},
          child: Image.asset(AppAssets.menu),
        ),
      ),


      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
                height: size.height * 1 / 10,
                padding: const EdgeInsets.all(16),
                alignment: Alignment.centerLeft,
                child: Text(
                  '“It is amazing how complete is the delusion that beauty is goodness.”',
                  style: AppStyles.h5
                      .copyWith(fontSize: 12, color: AppColors.textColor),
                )),
            Container(
              height: size.height * 2 / 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                  
                },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right:16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Container(
                            alignment: Alignment.centerRight,
                            child: Image.asset(AppAssets.heart)),
                        RichText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                            text: TextSpan(
                                text: 'B',
                                style: TextStyle(
                                    fontFamily: FontFamily.sen,
                                    fontSize: 89,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      BoxShadow(
                                          color: Colors.black38,
                                          offset: Offset(3, 6),
                                          blurRadius: 6)
                                    ]),
                                children: [
                              TextSpan(
                                text: 'eautiful',
                                 style: TextStyle(
                                    fontFamily: FontFamily.sen,
                                    fontSize: 64,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      BoxShadow(
                                          color: Colors.black38,
                                          offset: Offset(3, 6),
                                          blurRadius: 6)
                                    ]),
                              )
                            ])),
                            Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: Text('“Think of all the beauty still left around you and be happy.”',
                              style: AppStyles.h4.copyWith(letterSpacing: 2,
                              color:AppColors.textColor ),),
                            ),
                            
                      Container(
                        alignment: Alignment.centerRight,
                        child:  Text('― Anne Frank',
                        style:AppStyles.h5.copyWith(
                        color:AppColors.textColor,fontSize: 18,fontWeight: FontWeight.bold)),
                      )
                      ]),
                    );
                  }),
                  
            ),
            
            Container(
              height: 12,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return buildIndicator(index == _currentIndex, size);
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {},
        child: Image.asset((AppAssets.exchange)),
      ),
      drawer:Drawer(
        child:Container(
          color:AppColors.lighBlue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Padding(
              padding: const EdgeInsets.only(top:24,left: 16),
              child: Text('Your mind',
              style: AppStyles.h3.copyWith(color: AppColors.textColor),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: AppButton(
                label:'Favorites',
                onTap: (){
                print("Favorites");
              }),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: AppButton(
                label:'Your control',
                onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(_)=>ControlPage()));
              }),
            )
            ],
            
          ),
        ) ),
    );
  }
  Widget buildIndicator(bool isActive,Size size){
    return Container(
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: isActive ? size.width*1/4:28,
      decoration: BoxDecoration(
        color: isActive ? AppColors.lighBlue:AppColors.lightGrey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(color: Colors.black38,offset: Offset(2, 3),blurRadius: 3)
        ] ),
        
    );
  }
}
// Widget buildIndicator
