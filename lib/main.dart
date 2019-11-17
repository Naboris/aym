import 'package:aym/page%202.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aym',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Aym'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  List joueurs = <String>[];

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Widget ListeJoueurs() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: joueurs.length,
        itemBuilder: (context, i) {
          return ListTile(
              title: Text(
                joueurs[i],
              )
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 200,
              child: ListeJoueurs(),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      controller: myController,
                    ),
                  ),
                  FlatButton(
                    color: Colors.purple,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(2.0),
                    splashColor: Colors.purpleAccent,
                    onPressed: () {
                      _incrementCounter();
                      joueurs.add(myController.text);
                    },
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Text(
                    '$_counter',
                    style: Theme
                        .of(context)
                        .textTheme
                        .display1,
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: FlatButton(
                      color: Colors.purple,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(2.0),
                      splashColor: Colors.purpleAccent,
                      onPressed: () {
                        _pushSaved();
                      },
                      child: Text(
                        "Suivant",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  )
                ]
            )
          ],
        ),
      ),

    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>( // Add 20 lines from here...
        builder: (BuildContext context) {

          return  page2(joueurs: joueurs);
        },
      ),
    );
  }

}


