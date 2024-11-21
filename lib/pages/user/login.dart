import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hot_update_flutter/pages/controllers/userStatus.dart';
import 'package:hot_update_flutter/pages/tabs.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _username, _password;
  UserStatusController controller = Get.find<UserStatusController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value!.isEmpty) return 'Username is required';
                },
                onSaved: (value) => _username = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) return 'Password is required';
                },
                onSaved: (value) => _password = value!,
              ),
              const SizedBox(height: 50,),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                
                    print('Username: $_username, Password: $_password');
                    controller.login(_username);
                   
                    Get.offAll(const Tabs(index:3));
                      
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