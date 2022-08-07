import 'package:flutter/material.dart';

class ScaffoldExample extends StatelessWidget {
  const ScaffoldExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold"),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        backgroundColor: Colors.amberAccent.shade100,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => debugPrint("Button pressed."),
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      backgroundColor: Colors.amberAccent,
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: const Text(
                  "Pressed me",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: Colors.black),
                ),
                onTap: () => debugPrint("Tapped...."),
              )
            ],
          )),
    );
  }
}

class Home extends StatelessWidget //StatelessWidget is a build in class
{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
        color: Colors.cyanAccent,
        child: Center(
            child: Text(
          "Hello Flutter.",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 40,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.red),
        )));
    //return const Center(                                                         //Center is another widget & child is key property.
    //child: Text("Hello Flutter",textDirection: TextDirection.ltr,));
  }
}
