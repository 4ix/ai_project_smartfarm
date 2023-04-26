import 'package:flutter/material.dart';

class ChangePassWordScreen extends StatefulWidget {
  const ChangePassWordScreen({super.key});

  @override
  State<ChangePassWordScreen> createState() => _ChangePassWordScreenState();
}

class _ChangePassWordScreenState extends State<ChangePassWordScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBBD6B8),
      body: Center(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const Icon(
                    Icons.warning_rounded,
                    size: 70,
                    color: Color(0XFF94AF9F),
                  ),
                  const Text(
                    '비밀번호를 변경해 주세요!',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0XFF94AF9F),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    '안전한 사용을 위하여, 기존 비밀번호를 변경해야 합니다. 아래에 새 비밀번호를 입력해 주세요.',
                    style: TextStyle(
                      color: Color(0XFFDBE4C6),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    child: Column(
                      children: [
                        TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            hintText: '현재 비밀번호',
                            filled: true,
                            fillColor: Color(0xFFDBE4C6),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: controller2,
                          decoration: const InputDecoration(
                            hintText: '새 비밀번호',
                            filled: true,
                            fillColor: Color(0xFFDBE4C6),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: controller3,
                          decoration: const InputDecoration(
                            hintText: '비밀번호 확인',
                            filled: true,
                            fillColor: Color(0xFFDBE4C6),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ButtonTheme(
                    child: ElevatedButton(
                      onPressed: () {
                        // password API 호출하는거로 변경해야 함
                        if (controller2 != controller3) {
                          showSnackBar(
                            context,
                            const Text('비밀번호가 다릅니다.'),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF94AF9F),
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text(
                        '변경 완료',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFFDBE4C6),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, text) {
  final snackBar = SnackBar(
    content: text,
    backgroundColor: const Color(0xFF94AF9F),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
