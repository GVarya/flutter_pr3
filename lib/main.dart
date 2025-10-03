import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ScreenSwitcher(),
    );
  }
}

class ScreenSwitcher extends StatefulWidget {
  @override
  _ScreenSwitcherState createState() => _ScreenSwitcherState();
}

class _ScreenSwitcherState extends State<ScreenSwitcher> {
  int current = 0;

  String email = '';
  String login = '';
  String password = '';
  String loadStatus = 'нет данных';

  void saveLoginData(String l, String p) {
    setState(() {
      login = l;
      password = p;
    });
  }

  void saveSignInData(String eml, String logn, String passwd) {
    setState(() {
      email = eml;
      login = logn;
      password = passwd;
    });
  }

  void loadData(int index) {
    setState(() {
      loadStatus = 'данные загружены';
    });
  }

  List<Widget> get screens => [
    LoginScreen(onSave: saveLoginData),
    SignInScreen(onSave: saveSignInData),
    // DisplayScreen(login: login, password: password),
    // LoadDataScreen(status: loadStatus, onLoad: () => loadData(0)),
    // AboutAppScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Практика 3'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(child: screens[current]),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => current = 0),
                  child: Text('Авторизация'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => current = 1),
                  child: Text('Регистрация'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => current = 2),
                  child: Text('Пользователь'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => current = 3),
                  child: Text('Загрузка'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => current = 4),
                  child: Text('О приложении'),
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  final void Function(String, String) onSave;
  const LoginScreen({required this.onSave});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Text("Авторизация", style: TextStyle(fontSize: 32)),
        SizedBox(height: 64),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: TextField(
            controller: loginController,
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Логин'),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: TextField(
            controller: passwordController,
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Пароль'),
            obscureText: true,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            widget.onSave(loginController.text, passwordController.text);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Данные сохранены')));
          },
          child: Text('Сохранить'),
        ),
      ],
    );
  }
}


class SignInScreen extends StatefulWidget {
  final void Function(String, String, String) onSave;
  const SignInScreen({required this.onSave});
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
        SizedBox(height: 16),
        Text("Регистрация", style: TextStyle(fontSize: 32)),
        SizedBox(height: 64),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Почта'),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: TextField(
            controller: loginController,
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Логин'),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: TextField(
            controller: passwordController,
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Пароль'),
            obscureText: true,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            widget.onSave(emailController.text, loginController.text, passwordController.text);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Данные сохранены')));
          },
          child: Text('Сохранить'),
        ),
      ],
    );
  }
}
