import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  //  final Map arguments;
  // const SearchPage({super.key, required this.arguments});
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("搜索页面"),
      ),
      body: Center(
        // 获取路由传值
        child: Text('搜索id : ${Get.arguments["searchId"]}'),
      ),
    );
  }
}