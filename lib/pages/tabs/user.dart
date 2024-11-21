import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:hot_update_flutter/pages/controllers/userStatus.dart";
import "package:hot_update_flutter/routers/router.dart";


class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}
   UserStatusController controller = Get.find<UserStatusController>();
class _UserPageState extends State<UserPage> {

  @override
  Widget build(BuildContext context) {
      return  ListView(
        children: <Widget>[
          const UserProfile(),
          ListTile(
            title: const Text('设置'),
            onTap: () {
              // 处理点击'设置'的逻辑
            },
          ),
          const SizedBox(height: 20,),
            ListTile(
            title: const Text('退出登录'),
            onTap: () {
               controller.loginOut();
            },
          ),const SizedBox(height: 20,),
            ListTile(
            title: const Text('关于我们'),
            onTap: () {
              // 处理点击'关于我们'的逻辑
            },
          ),
           const SizedBox(height: 20,),
           ListTile(
                onTap: () {
                  Get.bottomSheet(Container(
                    color: Get.isDarkMode ? Colors.black38 : Colors.white,
                    height: 200,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.wb_sunny_outlined,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                          title: Text('白天模式',
                              style: TextStyle(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                              )),
                          onTap: () {
                            Get.changeTheme(ThemeData.light());
                            Get.back();
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.wb_sunny,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black),
                          title: Text('黑夜模式',
                              style: TextStyle(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black)),
                          onTap: () {
                            Get.changeTheme(ThemeData.dark());
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  ));
                },
                title: const Text("切换主题颜色")),
          
          const SizedBox(height: 50,),
          ListTile(
            title: const Text('注册'),
            onTap: () {
              Get.put(RoutePath.login);
            },
          ),
          
        ],
      );
  }
}
 
class UserProfile extends StatelessWidget {
  const UserProfile({super.key});
 
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage('https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'),
      ),
      title: Obx(()=> Text('${controller.status}')),
      subtitle: const Text('邮箱'),
      onTap: (){
         Navigator.pushNamed(context, '/login');
      },
    );
  }
}