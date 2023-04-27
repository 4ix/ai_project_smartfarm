import 'package:flutter/material.dart';
import 'package:smartfarm/models/colors_model.dart';
import 'package:smartfarm/models/users_model.dart';
import 'package:smartfarm/shared/home_screen.dart';

import '../services/api_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  final Future<List<UsersModel>> users = ApiService.getUsers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsModel.first,
      body: FutureBuilder(
        future: users,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LoginWidget(
              controller: controller,
              controller2: controller2,
              userSnapshot: snapshot,
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget(
      {super.key,
      required this.controller,
      required this.controller2,
      required this.userSnapshot});

  final TextEditingController controller;
  final TextEditingController controller2;
  final AsyncSnapshot<List<UsersModel>> userSnapshot;

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
                  onPressed: () {
                    if (userSnapshot.data!
                        .any((user) => user.id == controller.text)) {
                      final int userIndex = userSnapshot.data!
                          .indexWhere((user) => user.id == controller.text);
                      if (controller2.text ==
                          userSnapshot.data![userIndex].password) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => HomeScreen(
                              userIndex: userIndex,
                              userName: userSnapshot.data![userIndex].username,
                              userEmail: userSnapshot.data![userIndex].email,
                            ),
                          ),
                        );
                      } else {
                        showSnackBar(context, const Text('비밀번호가 틀렸습니다.'));
                      }
                    } else {
                      showSnackBar(context, const Text('잘못된 정보입니다.'));
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
