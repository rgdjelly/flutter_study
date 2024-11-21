import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('注册'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: '邮箱'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入邮箱';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: '密码'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入密码';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),
                 const SizedBox(height: 50,),
              ElevatedButton(
                child: const Text('注册'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // 在这里添加注册逻辑
                    print('注册邮箱: $_email 密码: $_password');
                    // Navigator.pushNamed(context, '/login');
                    Get.toNamed('/login');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}