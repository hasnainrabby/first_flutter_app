import 'package:first_flutter_app/utill/hexcolor.dart';
import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator ({Key? key}) : super(key: key);

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {

  int _tipPercentage = 0;
  int _personCounter = 0;
  double _billAmount = 0.0;
  Color _lightblue = HexColor("#e6e6ff");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Tip Calculator",style: TextStyle(color: _lightblue)),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Container(

        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: [
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),  //dynamic code for various type of device
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                color: _lightblue
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text("Total per person",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("\$${calculateTotalPerPerson(_billAmount,_personCounter,_tipPercentage)}",
                        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),

              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.indigo.shade100,
                  style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Column(
                children:  [
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: _lightblue),
                    decoration: const InputDecoration(
                      prefixText: "Enter Amount ",
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    onChanged: (String value){
                      try{
                        _billAmount = double.parse(value);

                      } catch(exception){
                        _billAmount = 0.0;
                      }
                    }
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Split",style: TextStyle(color: Colors.grey.shade700),),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                if(_personCounter > 1){
                                  _personCounter--;
                                }else{
                                  //nothing to do
                                }
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: _lightblue.withOpacity(0.1),
                              ),
                              child: const Center(
                                child: Text(
                                  "-",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          Text("$_personCounter",style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          ),),
                          InkWell(
                            onTap: (){
                              setState(() {
                                  _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: _lightblue.withOpacity(0.1),
                              ),
                              child: const Center(
                                child: Text(
                                  "+",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tip",style: TextStyle(
                            color: Colors.grey.shade700
                        ),),
                        Text("\$${(calculateTotalTip(_billAmount, _personCounter, _tipPercentage)).toStringAsFixed(2)}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,
                            color: Colors.grey.shade700
                        ))
                      ],
                    ),
                  ),
                  //Slider 
                  Column(
                    children: [
                      Text("$_tipPercentage%",style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: _lightblue.withOpacity(1.0))),
                      Slider(
                          min: 0,
                          max: 100,
                          activeColor: _lightblue,
                          inactiveColor: Colors.grey,
                          divisions: 10,
                          value: _tipPercentage.toDouble(),
                          onChanged: (double newValue){
                           setState(() {
                             _tipPercentage = newValue.round();
                           });

                      })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  calculateTotalPerPerson(double billAmount,int splitBy,int tipPercentage){
    var totalPerPerson = (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount)/ splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }
  calculateTotalTip(double billAmount,int splitBy,int tipPercentage){
    double totalTip = 0.0;
    if(billAmount < 0 || billAmount.toString().isEmpty || billAmount == null){
      //nothing to do
    }else{
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }
}


class Wisdom extends StatefulWidget {
  const Wisdom({Key? key}) : super(key: key);

  @override
  State<Wisdom> createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "There is always light. If only we’re brave enough to see it. If only we’re brave enough to be it.",
    "If you want the rainbow, you have to put up with the rain.",
    "Those who say it can’t be done are usually interrupted by others doing it.",
    "If it doesn't make the world better, don't do it.",
    "Hope will never be silent."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Positive Quote",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      backgroundColor: Colors.black45,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  width: 400,
                  height: 300,
                  margin: const EdgeInsets.only(left:10.0,right:10.0,top: 15.0,bottom: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.teal
                  ),
                  child: Center(
                    child: Text(
                      quotes[_index % quotes.length],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(thickness: 2.5,color: Colors.white70,),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextButton.icon(
                  onPressed: _showQuote,
                  icon: const Icon(Icons.table_rows_sharp,color: Colors.grey,),
                  label: const Text("Pressed Here!")),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    //increment our index/counter
    setState(() {
      _index += 1;
    });
  }
}

class BizCard extends StatelessWidget {
  const BizCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BizCard",
          style: TextStyle(color: Colors.white),
        ),
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
          color: Colors.cyanAccent, borderRadius: BorderRadius.circular(15.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "MD HASNAIN RABBY",
            style: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w800),
          ),
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
          border: Border.all(color: Colors.cyan, width: 5.0),
          image: const DecorationImage(
              image: NetworkImage("https://picsum.photos/300/300"))),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Account'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Alarm')
        ],
        onTap: (int index) => debugPrint("Tapped item: $index"),
      ),
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
