import 'package:flutter/material.dart';

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
              style: TextStyle(fontSize: 40,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            )));
    //return const Center(                                                         //Center is another widget & child is key property.
    //child: Text("Hello Flutter",textDirection: TextDirection.ltr,));
  }
}