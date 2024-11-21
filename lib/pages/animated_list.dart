import 'dart:async';

import 'package:flutter/material.dart';

/// Dart Flutter中关于animated list组件的使用。通过该组件，可以在列表中插入或删除节点时实现动画效果。与list view相比，animated list在操作时只需一个动画。教程通过实例演示了如何在animated list中增加数据，并详细讲解了如何使用global key和insertitem方法来改变animated list的状态。
///

class AnimatedListPage extends StatefulWidget {
  const AnimatedListPage({super.key});

  @override
  State<AnimatedListPage> createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  // 定义GlobalKey
  final _globalKey = GlobalKey<AnimatedListState>();
  // 定义一个删除开关flag
  bool flag = true;
  List<String> list = ['第一条', '第二条', '第三条'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List'),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            list.add('新增的数据');
            _globalKey.currentState!.insertItem(list.length - 1);
          }),
      body: AnimatedList(
          key: _globalKey,
          initialItemCount: list.length,
          itemBuilder: (context, index, animation) {
            return FadeTransition(opacity: animation, child: _buildItem(index));
          }),
    );
  }

  _buildItem(int index) {
    return ListTile(
      leading: const Icon(Icons.mail),
      title: Text(list[index]),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: (){
          _deleteItem(index);
        },
      ),
    );
  }

  _deleteItem(index) {
    if (flag == true) {
      flag = false;
      _globalKey.currentState!.removeItem(index, (context, animation) {
        var removeItem = _buildItem(index);
        // 删除数组中的数据
        list.removeAt(index);
        return FadeTransition(
          opacity: animation,
          child: removeItem,
        );
      });
      // 删除延迟动画，重置删除flag，防止报错
      Timer.periodic(const Duration(milliseconds: 500), (timer) {
        flag = true;
        timer.cancel();
      });
    }
  }
}
