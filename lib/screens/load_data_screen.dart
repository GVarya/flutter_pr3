import 'package:flutter/material.dart';

class LoadDataScreen extends StatelessWidget {
  final String status;
  final VoidCallback onLoad;

  const LoadDataScreen({Key? key, required this.status, required this.onLoad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Загрузка данных', style: TextStyle(fontSize: 24)),
        const SizedBox(height: 20),
        Text('Статус: $status', style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: onLoad, child: const Text('Загрузить данные')),
      ],
    );
  }
}
