import 'package:aym/pages/game_info_page.dart';
import 'package:flutter/material.dart';

class AddPlayerPage extends StatefulWidget {
  AddPlayerPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AddPlayerPageState createState() => _AddPlayerPageState();
}

class _AddPlayerPageState extends State<AddPlayerPage> {
  List joueurs = <String>[];

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
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
            Expanded(
              // height: 200,
              child: _listeJoueurs(),
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
                      setState(() {
                        joueurs.add(myController.text);
                      });
                    },
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Text(
                    '${joueurs.length}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ]),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
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
            ])
          ],
        ),
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return GameInfoPage(joueurs: joueurs);
        },
      ),
    );
  }

  Widget _listeJoueurs() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: joueurs.length,
        itemBuilder: (context, i) {
          return ListTile(
              title: Text(
            joueurs[i],
          ));
        });
  }
}
