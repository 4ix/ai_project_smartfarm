import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smartfarm/models/colors_model.dart';

import 'dart:convert';

import '../models/users_model.dart';
import '../shared/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsModel.first,
      body: LoginWidget(
        controller: controller,
        controller2: controller2,
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
    required this.controller,
    required this.controller2,
  });

  final TextEditingController controller;
  final TextEditingController controller2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 50,
      ),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Image(
                image: AssetImage('assets/login.png'),
              ),
              Form(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      TextField(
                        controller: controller,
                        autofocus: true,
                        decoration: const InputDecoration(
                          icon: Material(
                            elevation: 5.0,
                            color: ColorsModel.second,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                          hintText: 'ID',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: ColorsModel.fourth,
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: controller2,
                        decoration: const InputDecoration(
                          icon: Material(
                            elevation: 5.0,
                            color: ColorsModel.second,
                            child: Icon(
                              Icons.lock,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                          hintText: 'password',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: ColorsModel.fourth,
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonTheme(
                child: ElevatedButton(
                  onPressed: () async {
                    final url =
                        Uri.parse('http://172.16.10.57:5000/farm/v1/login');
                    final response = await http.post(
                      url,
                      body: {
                        'id': controller.text,
                        'password': controller2.text,
                      },
                    );

                    if (response.statusCode == 200) {
                      var result =
                          UsersModel.fromJson(json.decode(response.body));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => HomeScreen(
                            userId: result.id,
                            userName: result.username,
                            userEmail: result.email,
                          ),
                        ),
                      );
                    } else {
                      showSnackBar(
                          context, const Text('아이디 혹은 비밀번호를 확인해 주세요 😊'));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsModel.third,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text(
                    '로그인',
                    style: TextStyle(
                      fontSize: 30,
                      color: ColorsModel.fourth,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, text) {
  final snackBar = SnackBar(
    content: text,
    backgroundColor: ColorsModel.third,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
