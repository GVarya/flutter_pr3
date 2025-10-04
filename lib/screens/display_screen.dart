import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  final String login;
  final String password;

  const DisplayScreen({Key? key, required this.login, required this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Логин:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(login.isEmpty ? 'не задан' : login, style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 20),
        const Text('Пароль:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(password.isEmpty ? 'не задан' : password, style: const TextStyle(fontSize: 18)),
      ],
    );
  }
}
