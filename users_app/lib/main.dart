import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:users_app/models/models.dart';
import 'dart:async';
import 'dart:convert';

import 'package:users_app/models/user_response_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Users App',
      home: _HomePage(),
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
      ),
    );
  }
}

class _HomePage extends StatefulWidget {
  @override
  __HomePageState createState() => __HomePageState();
}

class __HomePageState extends State<_HomePage> {
  List<User> users = [];

  getUsers() async {
    http.Response response =
        await http.get(Uri.parse('http://localhost:3080/api/users'));

    setState(() {
      users = UsersResponse.fromJson(response.body).results.users;
    });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users App'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (_, int index) {
          return Container(
            child: UserSingleCard(index: index, user: users[index]),
          );
        },
      ),
    );
  }
}

class UserSingleCard extends StatelessWidget {
  final User user;
  final int index;

  const UserSingleCard({
    Key? key,
    required this.user,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 7),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                foregroundImage: NetworkImage(user.avatar),
                child: Text(
                  '${user.initials}',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text('${index + 1} - ${user.name}',
                  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
