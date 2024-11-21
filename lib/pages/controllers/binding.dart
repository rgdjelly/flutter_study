import 'package:get/get.dart';
import 'package:hot_update_flutter/pages/controllers/userStatus.dart';

// 全局管控controls 
class AllGetControlBinding implements Bindings {
  @override
  void dependencies() {

    // 懒加载controller
    Get.lazyPut(() => UserStatusController());
  }
  
}