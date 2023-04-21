import 'package:flutter/material.dart';
import 'package:smartfarm/screens/home_screen.dart';

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
        backgroundColor: const Color(0xFFBBD6B8),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
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
                                color: Color(0xFFAEC2B6),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                              hintText: 'ID',
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Color(0xFFDBE4C6),
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
                                color: Color(0xFFAEC2B6),
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                              hintText: 'password',
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Color(0xFFDBE4C6),
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
                  const Text(
                    '비밀번호변경',
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonTheme(
                    child: ElevatedButton(
                      onPressed: () {
                        // login API 호출하는거로 변경해야 함
                        if (controller.text == 'test' &&
                            controller2.text == '1234') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const HomeScreen()));
                        } else if (controller.text == 'test' &&
                            controller2.text != '1234') {
                          showSnackBar(context, const Text('비밀번호가 틀렸습니다.'));
                        } else if (controller.text != 'test' &&
                            controller2.text == '1234') {
                          showSnackBar(context, const Text('아이디가 틀렸습니다.'));
                        } else {
                          showSnackBar(context, const Text('잘못된 정보입니다.'));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF94AF9F),
                          minimumSize: const Size.fromHeight(50)),
                      child: const Text(
                        '로그인',
                        style:
                            TextStyle(fontSize: 30, color: Color(0xFFDBE4C6)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

void showSnackBar(BuildContext context, text) {
  final snackBar = SnackBar(
    content: text,
    backgroundColor: const Color(0xFF94AF9F),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
