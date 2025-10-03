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

  void saveLoginData(String lgn, String passwd) {
    setState(() {
      login = lgn;
      password = passwd;
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
    DisplayScreen(login: login, password: password),
    LoadDataScreen(status: loadStatus, onLoad: () => loadData(0)),
    AboutAppScreen(),
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

class DisplayScreen extends StatelessWidget {
  final String login;
  final String password;
  const DisplayScreen({required this.login, required this.password});
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Логин:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(login.isEmpty ? 'не задан' : login, style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          Text('Пароль:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(password.isEmpty ? 'не задан' : password, style: TextStyle(fontSize: 18)),
        ],
      );
  }
}

class LoadDataScreen extends StatelessWidget {
  final String status;
  final VoidCallback onLoad;
  const LoadDataScreen({required this.status, required this.onLoad});
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Загрузка данных',
              style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Text('Статус: $status', style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          ElevatedButton(onPressed: onLoad, child: Text('Загрузить данные')),
        ],
      );
  }
}

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Задание на практическую работу',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                'Необходимо подготовить приложение, позволяющее производить смену контента на экране.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                'Приложение должно содержать минимум 5 отдельных виджета с контентом экрана, а также они должны быть все связаны логически.',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                'Студенту требуется выполнить все пункты в плане практической работы с конспектированием своих действий, а также фотофиксацией контрольных точек в отчете о практической работе.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.teal,
                ),
              ),
            ),
          ],
        ),
      );
  }
}