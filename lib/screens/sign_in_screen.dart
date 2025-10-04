import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  final void Function(String, String, String) onSave;
  const SignInScreen({Key? key, required this.onSave}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const Text("Регистрация", style: TextStyle(fontSize: 32)),
        const SizedBox(height: 64),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextField(
            controller: emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Почта',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextField(
            controller: loginController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Логин',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Пароль',
            ),
            obscureText: true,
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            widget.onSave(emailController.text, loginController.text, passwordController.text);
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Данные сохранены')));
          },
          child: const Text('Сохранить'),
        ),
      ],
    );
  }
}
