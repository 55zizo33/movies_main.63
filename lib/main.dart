import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/core/helper_methods.dart';
import 'package:project/service_locator.dart';
import 'package:project/views/contact_us.dart';
import 'package:project/views/products/view.dart';
import 'package:shimmer/main.dart';
import 'core/logic/app_theme.dart';
import 'core/logic/cache_helper.dart';
import 'views/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  print(CacheHelper.name);
  print(CacheHelper.age);
  initServiceLocator();
  runApp(
      const MyApp());
}
  class MyApp extends StatelessWidget {
    const MyApp({super.key});
    @override
    Widget build(BuildContext context) {
      return ScreenUtilInit(
        designSize: const Size(430,932 ),
        child:ContactUsView() ,
        builder: (context, child) =>  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Tranquility",
          navigatorKey: navigatorKey,
          theme: AppTheme.light,
          home:child,
        ),
      );
    }
  }




