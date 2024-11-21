import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetDialog extends StatelessWidget {
  const GetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Get Dialog Show",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GetShowPage(),
    );
  }
}

class GetShowPage extends StatelessWidget{
  const GetShowPage({super.key});
  
  @override
  Widget build(Object context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}