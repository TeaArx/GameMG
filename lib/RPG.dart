import 'package:flutter/material.dart';


class RPG extends StatelessWidget {
  const RPG({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Gam> myProducts = [];
    myProducts.add(Gam('ELDEN RING','ELDENRING.jpg'));
    myProducts.add(Gam('Valheim','Valheim.jpeg'));
    myProducts.add(Gam('Crusader Kings III','CrusaderKingsIII.jpg'));
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('RPG'),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 7 / 5,
              mainAxisSpacing: 20),
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
                    Image(image: AssetImage(myProducts[index].ime), fit:BoxFit.fitWidth),
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

class Gam {
  String name;
  String ime;
  Gam(this.name, this.ime);
}