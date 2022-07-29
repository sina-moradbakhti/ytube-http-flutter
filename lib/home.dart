import 'package:flutter/material.dart';
import 'package:sampleapp/models/user.model.dart';
import 'package:sampleapp/service/apis.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<User> _users = [];
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HTTP Request')),
      body: Center(
        child: loading
            ? const SizedBox(
                width: 20, height: 20, child: CircularProgressIndicator())
            : (_users.isEmpty
                ? TextButton(
                    child: const Text(
                      'Users API call',
                      style: TextStyle(fontSize: 23),
                    ),
                    onPressed: () {
                      setState(() {
                        loading = true;
                      });
                      ServiceApis.users().then((users) {
                        _users = [];
                        for (var user in users?['data']) {
                          _users.add(User.fromJson(user));
                        }

                        setState(() {
                          loading = false;
                        });
                      });
                    })
                : ListView.builder(
                    itemBuilder: (context, index) => Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.network(_users[index].avatar),
                            ),
                            const SizedBox(width: 15),
                            Text(
                              _users[index].fullname,
                              style: const TextStyle(fontSize: 19),
                            )
                          ],
                        ),
                      ),
                    ),
                    itemCount: _users.length,
                  )),
      ),
    );
  }
}
