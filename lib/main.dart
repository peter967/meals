import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'view/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
    overlays: [SystemUiOverlay.bottom],
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Api Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            titleTextStyle: TextStyle(
              color: Colors.amber,
              fontSize: 25.sp,
            ),
          ),
          useMaterial3: true,
          cardTheme: CardTheme(
            margin: EdgeInsets.all(10.sp),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.black,
            surfaceTintColor: Colors.black,
          ),
        ),
        home: const Home(),
      );
    });
  }
}
