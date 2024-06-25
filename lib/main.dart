import 'package:bloc/bloc.dart';
import 'package:councils/modules/logo_page/logo_page.dart';
import 'package:councils/shared/network/local/cache_helper.dart';
import 'package:councils/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc_observer.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
 // final prefs=await SharedPreferences.getInstance();
 // final isFirstLoanch=prefs.getBool('isFirstLoanch')??true;
  DioHelper.init();
  await CacheHelper.init();
  String token;
  //token=CacheHelper.getData(key: 'token');
  runApp(const MyApp());
 // runApp( MyApp(isFirstLoanch:isFirstLoanch));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 // final bool isFirstLoanch;

 // const MyApp({super.key, required this.isFirstLoanch});

 // const MyApp({super.key, required bool isFirstLoanch});


  @override
  Widget build(BuildContext context) {
    return   ScreenUtilInit(
      designSize : const Size(360,690),
      splitScreenMode : true,
      minTextAdapt : true,
      child: MaterialApp(

        theme: ThemeData(

           appBarTheme: const AppBarTheme(
             systemOverlayStyle: SystemUiOverlayStyle(
               statusBarColor: Colors.white,

             )
           )
          // snackBarTheme: SnackBarThemeData(
          //   backgroundColor: Colors.white,
          // )
          // snackBarTheme: SnackBarThemeData(
          //   backgroundColor: Colors.blue
          // )
          //  primarySwatch: Colors.blue
         // primaryColor: Colors.blue
          //  scaffoldBackgroundColor:  Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
      // home: LoginScreen(),
        home: const LogoPage(),
      ),
    );
  }
}



