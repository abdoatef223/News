import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c19/core/resources/app_theme.dart';
import 'package:news_c19/core/resources/routes_manager.dart';
import 'package:news_c19/ui/home/screen/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'News App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routes: {
            RoutesManager.homeRouteName:(_)=>HomeScreen()
          },
          initialRoute: RoutesManager.homeRouteName,
        );
      },
    );
  }
}
