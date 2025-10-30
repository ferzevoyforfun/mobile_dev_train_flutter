import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Продвинутый Профиль',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
      ),
      home: const AdvancedProfilePage(),
    );
  }
}

class AdvancedProfilePage extends StatelessWidget {
  const AdvancedProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мой Профиль'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Открыты настройки')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === Аватар и основная информация ===
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/44375456',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Анна Петрова',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Text(
                    'Senior Flutter Developer',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildTag('Dart'),
                      _buildTag('Flutter'),
                      _buildTag('Firebase'),
                      _buildTag('UI/UX'),
                      _buildTag('Web'),
                      _buildTag('Mobile'),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),

            // === Статистика ===
            const Text(
              'Статистика',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStat('Проекты', '24'),
                _buildStat('Клиенты', '18'),
                _buildStat('Звёзды', '2.1K'),
              ],
            ),
            const Divider(height: 40),

            // === Контакты ===
            const Text(
              'Контакты',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildContactItem(Icons.email, 'anna.dev@example.com'),
            _buildContactItem(Icons.phone, '+7 (999) 123-45-67'),
            _buildContactItem(Icons.location_on, 'Москва, Россия'),
            const Divider(height: 40),

            // === Навыки ===
            const Text(
              'Навыки',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildSkill('Flutter', 95),
            _buildSkill('Dart', 90),
            _buildSkill('Firebase', 85),
            _buildSkill('REST API', 80),
            _buildSkill('Git / GitHub', 90),
            const Divider(height: 40),

            // === Проекты ===
            const Text(
              'Последние проекты',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildProjectCard(
              context,
              'TaskFlow',
              'Умный менеджер задач с синхронизацией в облаке',
              Icons.checklist,
            ),
            const SizedBox(height: 12),
            _buildProjectCard(
              context,
              'FitTrack',
              'Фитнес-трекер с аналитикой тренировок',
              Icons.fitness_center,
            ),
            const SizedBox(height: 12),
            _buildProjectCard(
              context,
              'Weatherly',
              'Минималистичное приложение погоды с анимациями',
              Icons.wb_sunny,
            ),
            const Divider(height: 40),

            // === Действия ===
            const Text(
              'Быстрые действия',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildActionChip(context, 'Портфолио', Icons.folder),
                _buildActionChip(context, 'GitHub', Icons.code),
                _buildActionChip(context, 'LinkedIn', Icons.people),
                _buildActionChip(context, 'Написать', Icons.mail),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Новое действие'),
              content: const Text('Что вы хотите сделать?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Отмена'),
                ),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Действие выполнено!')),
                    );
                    Navigator.pop(ctx);
                  },
                  child: const Text('Подтвердить'),
                ),
              ],
            ),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Новое'),
      ),
    );
  }

  // Вспомогательные методы (без использования context, кроме где нужно)

  Widget _buildTag(String text) {
    return Chip(
      label: Text(text),
      backgroundColor: Colors.blue.shade50,
      labelStyle: const TextStyle(color: Colors.blue),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(text),
    );
  }

  Widget _buildSkill(String name, int percent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('$percent%'),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: percent / 100,
          backgroundColor: Colors.grey.shade200,
          color: Colors.blue,
          minHeight: 6,
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  // Методы, использующие context → принимают его как параметр

  Widget _buildProjectCard(
    BuildContext context,
    String title,
    String desc,
    IconData icon,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.blue),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildActionChip(
    BuildContext context,
    String label,
    IconData icon,
  ) {
    return OutlinedButton.icon(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Открыто: $label')),
        );
      },
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.blue),
        foregroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}