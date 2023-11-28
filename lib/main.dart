import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Widget principal de la aplicación.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto Introductorio',
      theme: ThemeData(
        // Función para cambiar el color del background.
        scaffoldBackgroundColor: Colors.blue[50],
      ),
      home: const FirstPage(),
    );
  }
}

// Widget de la primera página.
class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web Introducción'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: const Center(
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Muestra información sobre el usuario.
              Text(
                '¿Quién soy?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Muestra información adicional.
              Text(
                'Desde estudiante de grado medio a estudiante de grado superior',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                'Gran ambición por la tecnología y programación...',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      // Llama a la función FooterNavigation para que se muestre el menú inferior de la pantalla.
      bottomNavigationBar: const FooterNavigation(currentIndex: 0),
    );
  }
}

// Widget de la segunda página.
class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre mí'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Muestra información personal.
            Text(
              'Marc Montoya Pons',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Lorem ipsum dolor sit',
              style: TextStyle(fontSize: 15, color: Colors.grey[500]),
            ),
            SizedBox(height: 20),
            Text(
              'About me:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              // Texto de marcador de posición para información adicional.
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 20),
            Text(
              'Contacto:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Tel: +34 2878745421',
              style: TextStyle(fontSize: 15, color: Colors.grey[500]),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      // Llama a la función FooterNavigation para que se muestre el menú inferior de la pantalla.
      bottomNavigationBar: const FooterNavigation(currentIndex: 1),
    );
  }
}

// Widget de la tercera página.
class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Muestra tarjetas de comentarios.
            CardItem(
              name: 'Me ha encantado!',
              contact: 'Usuario:',
              description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. ',
              email: 'random@gmail.com',
              phoneNumber: '+34 972208402',
            ),
            // Más tarjetas de comentarios...
          ],
        ),
      ),
      // Llama a la función FooterNavigation para que se muestre el menú inferior de la pantalla.
      bottomNavigationBar: const FooterNavigation(currentIndex: 2),
    );
  }
}

// Widget de navegación inferior.
class FooterNavigation extends StatelessWidget {
  final int currentIndex;

  const FooterNavigation({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Sobre mí',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'Chat',
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) {
        // Maneja la navegación entre páginas.
        handleNavigation(context, index);
      },
    );
  }

  // Función para manejar la navegación entre páginas.
  void handleNavigation(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const FirstPage();
          }),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const SecondPage();
          }),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const ThirdPage();
          }),
        );
        break;
    }
  }
}

// Widget para mostrar tarjetas de comentarios.
class CardItem extends StatelessWidget {
  final String name;
  final String contact;
  final String email;
  final String description;
  final String phoneNumber;

  const CardItem({
    required this.name,
    required this.contact,
    required this.email,
    required this.description,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              description,
              style: TextStyle(fontSize: 15),
            ),
            Text(
              contact,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              email,
              style: TextStyle(color: Colors.grey[500], fontSize: 15),
            ),
            Text(
              phoneNumber,
              style: TextStyle(color: Colors.grey[500], fontSize: 15),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                  label: Text('Editar'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                  label: const Text('Borrar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
