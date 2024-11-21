import 'package:get/get.dart';

class UserStatusController extends GetxController{
  RxString status = "未登录".obs;

  void login(String userName) {
    status.value = userName;
    update();
  }

  void loginOut(){
    status.value = "未登录";
    update();
  }
}