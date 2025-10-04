import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              'Задание на практическую работу',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              'Необходимо подготовить приложение, позволяющее производить смену контента на экране.',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              'Приложение должно содержать минимум 5 отдельных виджета с контентом экрана, а также они должны быть все связаны логически.',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.deepPurple),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              'Студенту требуется выполнить все пункты в плане практической работы с конспектированием своих действий, а также фотофиксацией контрольных точек в отчете о практической работе.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.teal),
            ),
          ),
        ],
      ),
    );
  }
}
