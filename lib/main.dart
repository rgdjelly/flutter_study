import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hot_update_flutter/pages/controllers/binding.dart';
import 'package:hot_update_flutter/routers/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner :false,
        title: 'Flutter Demo',
        initialBinding: AllGetControlBinding(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          appBarTheme: const AppBarTheme(centerTitle:  true),
          useMaterial3: true,
        ),
        // 初始化路由
        initialRoute: "/",
        // onGenerateRoute: onGenerateRoute,
        defaultTransition: Transition.rightToLeft,
        getPages:  AppRoute.routes,
    );
  }
}
 