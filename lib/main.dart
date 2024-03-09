// ignore_for_file: unused_import
import 'package:bank/splash_screen.dart';
import 'package:bank/temporary/authentication/local_auth.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth/authenticate.dart';
import 'auth/local_auth.dart';
import 'auth/login_or_register_decider.dart';
import 'auth/login_view.dart';
import 'firebase_options.dart';
import 'navigate_bar_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'temporary/test.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
      enabled: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: const Responsive(),
          // const LoginView(),
        );
      },
    );
  }
}
