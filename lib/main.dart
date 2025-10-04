import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/display_screen.dart';
import 'screens/load_data_screen.dart';
import 'screens/about_app_screen.dart';

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
      home: const ScreenSwitcher(),
    );
  }
}

class ScreenSwitcher extends StatefulWidget {
  const ScreenSwitcher({Key? key}) : super(key: key);
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

  void loadData() {
    setState(() {
      loadStatus = 'данные загружены';
    });
  }

  List<Widget> get screens => [
    LoginScreen(onSave: saveLoginData),
    SignInScreen(onSave: saveSignInData),
    DisplayScreen(login: login, password: password),
    LoadDataScreen(status: loadStatus, onLoad: loadData),
    const AboutAppScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Практика 3'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(child: screens[current]),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => current = 0),
                  child: const Text('Авторизация'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => current = 1),
                  child: const Text('Регистрация'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => current = 2),
                  child: const Text('Пользователь'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => current = 3),
                  child: const Text('Загрузка'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => current = 4),
                  child: const Text('О приложении'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
