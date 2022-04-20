import 'package:flutter/material.dart';
import 'package:gamem/action_adventure.dart';
import 'package:gamem/RPG.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/man',
      routes: {
        '/man': (context) => MyApp(),
        '/arc': (context) => Acti(),
      },
    ));

class Gam {
  String name;
  String ime;
  Gam(this.name, this.ime);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Игры',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Все игры'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

void _menuOpen(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Меню'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Acti();
                    },
                  ),
                );
              },
              child: Text('Приключенческие боевики')),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RPG();
                    },
                  ),
                );
              },
              child: Text('RPG')),
        ],
      ),
    );
  }));
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Gam> myProducts = [];
    myProducts.add(Gam('GTA 5', 'gta.jpg'));
    myProducts.add(Gam('little nightmares ii', 'littlenightmares21.jpg'));
    myProducts.add(Gam('Hello Neighbor', 'HelloNeighbor.jpg'));
    myProducts.add(Gam('ELDEN RING', 'ELDENRING.jpg'));
    myProducts.add(Gam('Valheim', 'Valheim.jpeg'));
    myProducts.add(Gam('Crusader Kings III', 'CrusaderKingsIII.jpg'));
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: Icon(Icons.menu_open_outlined),
              onPressed: () {
                _menuOpen(context);
              },
            ),
          ],
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 7 / 5, mainAxisSpacing: 20),
          itemCount: myProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.amberAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              // 3
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                // 4
                child: Column(
                  children: [
                    Image(
                        image: AssetImage(myProducts[index].ime),
                        fit: BoxFit.fitWidth),
                    Text(
                      myProducts[index].name,
                      style: const TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
