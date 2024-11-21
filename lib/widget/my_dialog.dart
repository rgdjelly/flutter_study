import 'dart:async';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyDialog extends Dialog {
  String title;
  String content;
  // 接收关闭按钮的回调函数
  Function()? onClosed;

  // 使用定时器关闭弹框
  void _showTimer(context) {
    Timer.periodic(const Duration(milliseconds: 3000), (callback){
      print('自动关闭');
      Navigator.pop(context);
      callback.cancel();
    });
  }

  MyDialog(
      {super.key,
      required this.title,
      required this.onClosed,
      this.content = ""});

  @override
  Widget build(BuildContext context) {
     	// ---- 打开定时器
    _showTimer(context);
    
    return Material(
      // 定义显示透明
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.white,
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                // ---- 定义标题和关闭按钮
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(title),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: onClosed,
                      child: const Icon(Icons.close),
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            // ---- 定义显示的内容
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Text(content, textAlign: TextAlign.left),
            ),
          ]),
        ),
      ),
    );
  }
}
