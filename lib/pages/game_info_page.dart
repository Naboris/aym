import 'package:aym/pages/countdown_pages.dart';
import 'package:flutter/material.dart';

class GameInfoPage extends StatefulWidget {
  final List joueurs;
  final List dropdownValue;
  final List etats;
  final List roles;
  final List pseudos;
  GameInfoPage({
    Key key,
    this.joueurs,
    this.dropdownValue,
    this.etats,
    this.roles,
    this.pseudos,
  }) : super(key: key);

  @override
  _GameInfoPageState createState() => _GameInfoPageState();
}

class _GameInfoPageState extends State<GameInfoPage> {
  static List<String> allRoles = <String>[
    "Demon",
    "Grand Pretre",
    "Stratege",
    "Exorciste",
    "Prophete",
    "Tradi",
    "Medium",
    "Instinctif",
    "Conspi",
    "Humain",
    "Alarmiste",
    "Pandore",
  ];
  List myControllers;

  @override
  void initState() {
    myControllers =
        List.generate(widget.joueurs.length, (_) => TextEditingController());
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    for (TextEditingController controller in myControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("In Game "),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text("Prénom")),
                        DataColumn(label: Text("Pseudo")),
                        DataColumn(label: Text("Rôle")),
                        DataColumn(label: Text("Etat")),
                        DataColumn(label: Text("Rôle donné ?")),
                      ],
                      rows: List.generate(widget.joueurs.length, (i) {
                        return DataRow(cells: [
                          DataCell(// prénoms
                              Text(widget.joueurs[i])),
                          DataCell(
                            //pseudo
                            TextField(
                              controller: myControllers[i]
                                ..text = widget.pseudos[i] ?? widget.pseudos[i]
                                ..selection = TextSelection.collapsed(
                                  offset: widget.pseudos[i] != null
                                      ? widget.pseudos[i].length
                                      : 0,
                                ),
                              onChanged: (value) {
                                setState(() {
                                  widget.pseudos[i] = value;
                                });
                              },
                            ),
                            showEditIcon: true,
                            placeholder: true,
                          ),
                          DataCell(
                            //rôle
                            new DropdownButton<String>(
                              value: widget.dropdownValue[i],
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  widget.dropdownValue[i] = newValue;
                                });
                              },
                              items: allRoles.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          DataCell(//Etat
                              Checkbox(
                            value: widget.etats[i],
                            onChanged: (bool value) {
                              setState(() {
                                widget.etats[i] = value;
                              });
                            },
                          )),
                          DataCell(//Rôle donné ?
                              Checkbox(
                            value: widget.roles[i],
                            onChanged: (bool value) {
                              setState(() {
                                widget.roles[i] = value;
                              });
                            },
                          )),
                        ]);
                      }),
                    ),
                  ),
                ),
              ),
              Container(
                child: RaisedButton(
                  onPressed: () {
                    _pushSaved();
                  },
                  child: Text("Je suis un bouton"),
                ),
              ),
            ],
          ),
        ));
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return CountdownPage();
        },
      ),
    );
  }
}
