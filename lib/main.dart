//Navigation

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const appTitle = "Drawer Demo";

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      color: Colors.purple,
      home: MyHomePage(title: appTitle),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    Text("Hola", style: optionStyle)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 186, 221),
        centerTitle: true,
        foregroundColor: Colors.white,
        title: const Text("AppBar Demo"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: "Show Snackbar",
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(
                const SnackBar(content: Text("This is a snackbar"))
              );
            }
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            tooltip: "Show add alert",
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(
                content: Text("This is a snackbar add alert")));
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: "Go to the next page",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(title: const Text("Next page")),
                      body: const Center(
                        child: Text("This is the next page",
                          style: TextStyle(fontSize: 24)),
                      ),
                    );
                  }
                ),
              );
            },
          )
        ],
      ),
      body: Center(child: _widgetOptions[_selectedIndex]),
      drawer: Drawer(
        child: ListView(
          // Remove any padding from the ListView
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
                image: DecorationImage(
                  image: AssetImage('assets/img/logo.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.2,
                ),
              ),

              // Set the background
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Ver lista'),
              selected: _selectedIndex == 0,
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> const ListTileExample()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text('Ver cardview'),
              selected: _selectedIndex == 1,
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> const CardView()));
              },
            ),
          ],
        ),
      ),
    );
  }
}


class ListTitleApp extends StatelessWidget {
  const ListTitleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ListTileExample());
  }
}

class ListTileExample extends StatefulWidget {
  const ListTileExample({super.key});

  @override
  State<ListTileExample> createState() => _ListTileExampleState();
}

class _ListTileExampleState extends State<ListTileExample> {
  int _selectedIndex = 0;

  final List<String> leng = [
    "Python", "JavaScript", "Java", "C#", "SQL", "TypeScript", "Go", "Kotlin", "C++", "PHP"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lenguajes de programación")),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(
              index == _selectedIndex
              ? Icons.check_circle
              : Icons.radio_button_unchecked,
            ),
            title: Text(leng[index]),
            selected: index == _selectedIndex,
            selectedTileColor: Colors.blue.withOpacity(0.3),
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Card View")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.asset(
                  'assets/img/logo.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Título de la Card",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                child: Text(
                  "Hola, soy una cardview",
                  style: TextStyle(fontSize: 16, color: Color.fromARGB(137, 141, 23, 168)),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}