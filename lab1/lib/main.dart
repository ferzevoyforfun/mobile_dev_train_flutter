import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourist App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(),
    );
  }
}

// Модель данных
class User {
  final String login;
  final String password;
  final String role;

  const User(this.login, this.password, this.role);
}

class City {
  final String name;
  final List<Attraction> attractions;

  const City(this.name, this.attractions);
}

class Attraction {
  final String name;
  final String image;
  final String shortDescription;
  final String fullDescription;

  const Attraction(
    this.name,
    this.image,
    this.shortDescription,
    this.fullDescription,
  );
}

// Данные приложения
final users = [
  const User('admin', '12345', 'Администратор'),
  const User('user', '54321', 'Пользователь'),
];

final cities = [
  City('Санкт-Петербург', [
    Attraction(
      'Эрмитаж',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Winter_Palace_Panorama_3.jpg/960px-Winter_Palace_Panorama_3.jpg',
      'Крупнейший художественный музей мира',
      'Эрмитаж в Санкт-Петербурге является одним из крупнейших художественных музеев мира. Его коллекция насчитывает более трёх миллионов произведений искусства и памятников мировой культуры.',
    ),
    Attraction(
      'Петропавловская крепость',
      'https://static.78.ru/images/uploads/1686542964143.jpg',
      'Историческое ядро города',
      'Петропавловская крепость — историческое ядро Санкт-Петербурга, основанное в 1703 году Петром I. Здесь находится Петропавловский собор — усыпальница российских императоров.',
    ),
  ]),
  City('Москва', [
    Attraction(
      'Красная площадь',
      'https://upload.wikimedia.org/wikipedia/commons/f/f8/Views_of_Moscow_Kremlin_from_Red_Square%2C_2006_%2801%29.jpg',
      'Главная площадь России',
      'Красная площадь — главная площадь Москвы и всей России. Здесь находятся храм Василия Блаженного, Мавзолей Ленина и Московский Кремль.',
    ),
    Attraction(
      'Московский Кремль',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/%D0%9A%D1%80%D0%B5%D0%BC%D0%BB%D1%8C_%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0_5.jpg/1600px-%D0%9A%D1%80%D0%B5%D0%BC%D0%BB%D1%8C_%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0_5.jpg',
      'Исторический комплекс в центре Москвы',
      'Московский Кремль — исторический комплекс в центре Москвы, официальная резиденция Президента Российской Федерации. Один из крупнейших архитектурных ансамблей мира.',
    ),
  ]),
  City('Владивосток', [
    Attraction(
      'Золотой мост',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Zolotoy_Bridge_%28October_2024%29.jpg/500px-Zolotoy_Bridge_%28October_2024%29.jpg',
      'Вантовый мост через Золотой Рог',
      'Золотой мост — вантовый мост через бухту Золотой Рог во Владивостоке. Является одним из самых больших вантовых мостов в мире.',
    ),
    Attraction(
      'Маяк Эгершельд',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/%D0%9C%D0%B0%D1%8F%D0%BA_%D0%AD%D0%B3%D0%B5%D1%80%D1%88%D0%B5%D0%BB%D1%8C%D0%B4%D0%B0%2C_%D0%B8%D0%BB%D0%B8_%D0%A2%D0%BE%D0%BA%D0%B0%D1%80%D0%B5%D0%B2%D1%81%D0%BA%D0%B8%D0%B9_%D0%BC%D0%B0%D1%8F%D0%BA.jpg/1200px-%D0%9C%D0%B0%D1%8F%D0%BA_%D0%AD%D0%B3%D0%B5%D1%80%D1%88%D0%B5%D0%BB%D1%8C%D0%B4%D0%B0%2C_%D0%B8%D0%BB%D0%B8_%D0%A2%D0%BE%D0%BA%D0%B0%D1%80%D0%B5%D0%B2%D1%81%D0%BA%D0%B8%D0%B9_%D0%BC%D0%B0%D1%8F%D0%BA.jpg',
      'Исторический маяк на берегу пролива',
      'Маяк Эгершельд — один из старейших маяков Дальнего Востока, расположенный на окончании одноимённой косы. Является популярным местом для фотосессий.',
    ),
  ]),
];

// Экран авторизации
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class AdvancedProfilePage extends StatelessWidget {
  const AdvancedProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Авторизация')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Войти'),
            ),
            TextButton(
              onPressed: _guestLogin,
              child: const Text('Войти как гость'),
            ),
          ],
        ),
      ),
    );
  }
}

// Главный экран с навигацией
class MainScreen extends StatefulWidget {
  final User user;
  
  const MainScreen({super.key, required this.user});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const CitiesScreen(),
      ProfileScreen(user: widget.user),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Города',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

// Экран со списком городов
class CitiesScreen extends StatelessWidget {
  const CitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Города России')),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          final city = cities[index];
          return Card(
            child: ListTile(
              title: Text(city.name),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AttractionsScreen(city: city),
                  ),
                );
              },
            ),
          );
        },
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
        child: Column(
          children: [
            // Исправленное отображение изображения
            Container(
              width: double.infinity,
              height: 700,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  attraction.image,
                  fit: BoxFit.cover, // Заполнение контейнера без искажений
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.error,
                        color: Colors.grey,
                        size: 50,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              attraction.fullDescription,
              style: const TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

// Экран профиля
class ProfileScreen extends StatelessWidget {
  final User user;
  
  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Профиль')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            Text(
              'Логин: ${user.login}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Роль: ${user.role}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text('Выйти'),
            ),
          ],
        ),
      ),
    );
  }

  // === ВЫПАДАЮЩИЙ СПИСОК АВТОМОБИЛЕЙ ===
  Widget _buildCarSelector() {
    final List<String> cars = [
      'Toyota Camry',
      'Honda Civic',
      'BMW X5',
      'Mercedes-Benz C-Class',
      'Tesla Model 3',
      'Audi A4',
      'Ford Mustang',
      'Volkswagen Golf',
      'Hyundai Tucson',
      'Kia Sportage',
      'Nissan Qashqai',
      'Skoda Octavia',
      'Lada Granta',
      'UAZ Patriot',
      'Renault Duster',
      'Chevrolet Niva',
    ];

    return DropdownButton<String>(
      value: _selectedCar,
      items: cars.map((car) {
        return DropdownMenuItem<String>(
          value: car,
          child: Text(car),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _selectedCar = newValue;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Выбран автомобиль: $newValue')),
          );
        }
      },
      isExpanded: true,
      underline: Container(height: 1, color: Colors.grey.shade300),
      hint: const Text('Выберите автомобиль...'),
    );
  }
}