import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// 中间件的使用 
class Loginmiddleware extends GetMiddleware{
  @override
  RouteSettings? redirect(String? route) {
    // 没有登录时 先到登录页面
    return const RouteSettings(name: '/login');
  }
}