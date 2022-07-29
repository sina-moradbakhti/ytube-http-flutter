import 'package:flutter/material.dart';
import 'package:sampleapp/models/user.model.dart';
import 'package:sampleapp/service/apis.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _loading = false;
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HTTP Request Login')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
                controller: _username,
                style: const TextStyle(fontSize: 23),
                decoration: const InputDecoration(hintText: 'Username')),
            const SizedBox(height: 10),
            TextField(
                controller: _password,
                style: const TextStyle(fontSize: 23),
                decoration: const InputDecoration(hintText: 'Password')),
            const SizedBox(height: 30),
            TextButton(
                child: const Text(
                  'Log in',
                  style: TextStyle(fontSize: 23),
                ),
                onPressed: () async {
                  setState(() {
                    _loading = true;
                  });
                  final result =
                      await ServiceApis.login(_username.text, _password.text);
                  setState(() {
                    _loading = false;
                  });
                  if (result) {
                    _message = 'You are logged in now';
                  } else {
                    _message = 'Please enter valid username or password!';
                  }
                }),
            const SizedBox(height: 30),
            _loading
                ? const SizedBox(
                    width: 20, height: 20, child: CircularProgressIndicator())
                : Text(
                    _message,
                    style: const TextStyle(fontSize: 18),
                  )
          ],
        ),
      ),
    );
  }
}
