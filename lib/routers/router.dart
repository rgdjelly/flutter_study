import 'package:get/get.dart';
import 'package:hot_update_flutter/pages/animated_list.dart';
import 'package:hot_update_flutter/pages/form.dart';
import 'package:hot_update_flutter/pages/dialog_show.dart';
import 'package:hot_update_flutter/pages/middleware/loginMiddleware.dart';
import 'package:hot_update_flutter/pages/search.dart';
import 'package:hot_update_flutter/pages/tabs.dart';
import 'package:hot_update_flutter/pages/user/login.dart';
import 'package:hot_update_flutter/pages/user/signup%20.dart';

class AppRoute {
  static final routes = [
    GetPage(name: RoutePath.home, page: () => const Tabs()),
    // 配置中间件
    GetPage(
        name: RoutePath.search,
        page: () => const SearchPage(),
        middlewares: [Loginmiddleware()]),
    GetPage(name: RoutePath.form, page: () => const FormPage()),
    GetPage(name: RoutePath.login, page: () => const LoginPage()),
    GetPage(name: RoutePath.signup, page: () => const SignUpPage()),
    GetPage(name: RoutePath.dialogshow, page: () => const DialogDemoPage()),
    GetPage(name: RoutePath.animatedlist, page: () => const AnimatedListPage()),
  ];
}

class RoutePath {
  static const String home = "/";
  static const String login = "/login";
  static const String signup = "/signup";
  static const String search = "/search";
  static const String dialogshow = "/dialogshow";
  static const String form = "/form";
  static const String animatedlist = "/animatedlist";
} 