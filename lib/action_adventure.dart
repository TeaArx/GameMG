import 'package:flutter/material.dart';

class Acti extends StatelessWidget {
  const Acti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Gam> myProducts = [];
    myProducts.add(Gam('Grand Theft Auto V Год выхода: 2013 г.', 'gta.jpg'));
    myProducts.add(Gam(
        'little nightmares ii Год выхода: 2021 г.', 'littlenightmares21.jpg'));
    myProducts
        .add(Gam('Hello Neighbor Год выхода: 2017 г.', 'HelloNeighbor.jpg'));
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Приключенческие боевики'),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 7 / 5, mainAxisSpacing: 20),
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
                        color: Colors.black,
                        fontSize: 35.0,
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

class Gam {
  String name;
  String ime;

  Gam(this.name, this.ime);
}
