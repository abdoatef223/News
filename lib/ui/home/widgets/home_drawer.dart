import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_c19/core/resources/assets_manager.dart';
import 'package:news_c19/core/resources/strings_manager.dart';

class HomeDrawer extends StatelessWidget {
  void Function() goToHome;
  HomeDrawer(this.goToHome);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(0)
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Column(
          children: [
            Container(
              height: 166.h,
              alignment: Alignment.center,
              width: double.infinity,
              color:Theme.of(context).colorScheme.secondary ,
              child: Text(StringsManager.appTitle,style: Theme.of(context).textTheme.headlineMedium,),
            ),
            SizedBox(height: 16.h,),
            Padding(
              padding:  REdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      goToHome();
                    },
                    child: Row(
                      spacing: 8.w,
                      children: [
                        SvgPicture.asset(AssetsManager.home),
                        Text(StringsManager.goToHome,style: Theme.of(context).textTheme.titleMedium,)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
