import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_route/ui/home/product_screen/product_screen_view.dart';
import 'package:task_route/ui/utils/app_theme.dart';
import 'package:task_route/ui/utils/splash_screen.dart';

import 'domin/my_bloc_abserver.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(430, 932),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.mainTheme,
        initialRoute: SplashScreen.routeName,
        routes: {
          ProductScreenView.routeName: (context) => ProductScreenView(),
          SplashScreen.routeName: (context) => const SplashScreen()
        },
      ),
    );
  }
}
