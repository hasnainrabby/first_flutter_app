import 'package:flutter/material.dart';

class BizCard extends StatelessWidget{
  const BizCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("BizCard",
        style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent.shade700,

      ),
      backgroundColor: Colors.white70,
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            _getCard(),
            _getAvater(),
          ],
        ),
      ),
    );

  }

  Container _getCard() {
    return Container(
      width: 300,
      height: 200,
      margin: const EdgeInsets.all(50.0),
      decoration: BoxDecoration(
        color: Colors.cyanAccent,
        borderRadius: BorderRadius.circular(15.5)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Text("MD HASNAIN RABBY",
          style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w800),),
          const Text("Flutter Developer."),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.person_add_alt_1_rounded),
              Text(" @hasnainrabby"),
            ],
          )
        ],
      ),
    );
  }

 Container _getAvater() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(60.0)),
        border: Border.all(color: Colors.cyan,width: 5.0),
          image: const DecorationImage(image: NetworkImage("https://picsum.photos/300/300"))
      ),
    );
 }
  
}


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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        child: const Icon(Icons.cake),
        onPressed: () => debugPrint("I like cake."),

      ),
      bottomNavigationBar: BottomNavigationBar(items:  const [
        BottomNavigationBarItem(icon:Icon (Icons.account_box),label: 'Account'),
        BottomNavigationBarItem(icon:Icon (Icons.alarm),label: 'Alarm')
      ],onTap: (int index)=> debugPrint("Tapped item: $index"),),
      backgroundColor: Colors.amberAccent,
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustomButton()

              /* InkWell(
                child: const Text(
                  "Pressed me",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: Colors.black),
                ),
                onTap: () => debugPrint("Tapped...."),
              )*/

            ],
          )),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: const Text("hello Bangladesh!"),
          backgroundColor: Colors.limeAccent.shade700,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);


      },
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: Colors.lightBlue.shade700,
            borderRadius: BorderRadius.circular(5.0)),
        child: const Text(
          "Button",
          style: TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
