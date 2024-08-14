import 'dart:convert';

import 'package:d_info/d_info.dart';
import 'package:d_input/d_input.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jmp_3/home_page.dart';
import 'package:jmp_3/admin_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();

  login(BuildContext context) async {
    String url = 'http://192.168.71.99/jmp_3/user.php';
    var response = await http.post(Uri.parse(url), body: {
      'username': controllerUsername.text,
      'password': controllerPassword.text,
    });
    Map responseBody = jsonDecode(response.body);
    if (responseBody['success']) {
      DInfo.toastSuccess('Success Login');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminPage()),
      );
    } else {
      DInfo.toastError('Login Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DView.textTitle(color: Colors.black, 'Login Page'),
            DView.spaceHeight(),
            DInput(controller: controllerUsername, hint: 'Username'),
            DView.spaceHeight(),
            DInput(controller: controllerPassword, hint: 'Password'),
            DView.spaceHeight(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => login(context),
                child: const Text('Login as Admin'),
              ),
            ),
            DView.spaceHeight(),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: const Text('Continue without login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
