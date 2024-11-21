import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:hot_update_flutter/widget/my_dialog.dart";

class DialogDemoPage extends StatefulWidget {
  const DialogDemoPage({super.key});

  @override
  State<DialogDemoPage> createState() => _DialogDemoPageState();
}

class _DialogDemoPageState extends State<DialogDemoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pop(context);
      }),
      appBar: AppBar(title: const Text('Dialog Show')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _alertDialog, child: const Text("Alert Dialog")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: _selectDialog, child: const Text("Select Dialog")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: _modalBottomSheet,
                child: const Text("ModalBottomSheet")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: _customizeDialog,
                child: const Text("CustomizeDialog")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.snackbar('提示：', '您还没有登录！',
                      snackPosition: SnackPosition.BOTTOM);
                },
                child: const Text("GetX snackbar")),
            ElevatedButton(
                onPressed: () {
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
                child: const Text("切换主题颜色")),
          ],
        ),
      ),
    );
  }

  void _alertDialog() async {
    var dialogReuslt = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('提示信息！'),
            content: const Text('您确定要删除吗？'),
            actions: [
              TextButton(
                onPressed: () {
                  print('ok');
                  // 取消弹框
                  Navigator.of(context).pop('ok click');
                },
                child: const Text('确定'),
              ),
              TextButton(
                  onPressed: () {
                    print('cancel');
                    Navigator.of(context).pop('cancel click');
                  },
                  child: const Text('取消'))
            ],
          );
        });

    print(dialogReuslt);
  }

  void _selectDialog() async {
    var selectResult = showDialog(
        barrierDismissible: true, //表示点击灰色背景的时候是否消失弹出框
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('请选择'),
            children: [
              SimpleDialogOption(
                child: const Text("选项一"),
                onPressed: () {
                  Navigator.of(context).pop("选项一"); // 关闭窗口
                },
              ),
              SimpleDialogOption(
                child: const Text("选项二"),
                onPressed: () {
                  Navigator.of(context).pop("选项二"); // 关闭窗口
                },
              )
            ],
          );
        });
    print(selectResult);
  }

  void _modalBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 220,
            child: Column(
              children: [
                ListTile(
                  title: const Text("data"),
                  onTap: () {
                    print("点击了点赞");
                    Navigator.pop(context);
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text("转发"),
                  onTap: () {
                    print("点击了转发");
                    Navigator.pop(context);
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text("收藏"),
                  onTap: () {
                    print("点击了收藏");
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        });
  }

  void _customizeDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return MyDialog(
              title: "自定义Dialog标题",
              onClosed: () {
                Navigator.of(context).pop();
              },
              content: "自定义Dialog内容");
        });
  }
}
