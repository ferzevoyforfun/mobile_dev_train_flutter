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

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final login = _loginController.text;
    final password = _passwordController.text;

    final user = users.firstWhere(
      (u) => u.login == login && u.password == password,
      orElse: () => const User('', '', ''),
    );

    if (user.login.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(user: user),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Ошибка'),
          content: const Text('Неверный логин или пароль'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _guestLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreen(
          user: const User('guest', '', 'Гость'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Авторизация')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _loginController,
              decoration: const InputDecoration(labelText: 'Логин'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Пароль'),
              obscureText: true,
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
}

// Экран с достопримечательностями
class AttractionsScreen extends StatelessWidget {
  final City city;
  const AttractionsScreen({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(city.name)),
      body: ListView.builder(
        itemCount: city.attractions.length,
        itemBuilder: (context, index) {
          final attraction = city.attractions[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(attraction.image),
              ),
              title: Text(attraction.name),
              subtitle: Text(attraction.shortDescription),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AttractionDetailScreen(attraction: attraction),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Экран с детальной информацией
class AttractionDetailScreen extends StatelessWidget {
  final Attraction attraction;
  const AttractionDetailScreen({super.key, required this.attraction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(attraction.name)),
      body: SingleChildScrollView(
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
}