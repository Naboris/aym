import 'package:aym/page 3.dart';
import 'package:flutter/material.dart';


  class page2 extends StatefulWidget {
  final List joueurs;
   page2({
    Key key,
    List this.joueurs,
  }) : super(key: key);

  @override
  _page2State createState() => _page2State();

}
class _page2State extends State<page2> {

   List <String> dropdownValue ;
   List <bool> etat;
   List <bool> role;
  @override void initState() {
    // TODO: implement initState
     dropdownValue = List.generate
      (widget.joueurs.length,(i) {
        return "Demon";
      });
     etat = List.generate
       (widget.joueurs.length, (i)
     {
     return false;
     });
     role = List.generate
       (widget.joueurs.length, (i)
     {
       return false;
     });

    super.initState();
  }

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
        title: Text("In Game "),
      ),
      body: Container(
        child :Column(
          children: <Widget>[
            Expanded(
//              height: MediaQuery.of(context).size.height*0.79,
              child : SingleChildScrollView(
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
                    rows: List.generate
                      (widget.joueurs.length,(i) {
                      return DataRow(
                          cells: [
                            DataCell(// prénoms
                                Text (widget.joueurs[i])
                            ),
                            DataCell( //pseudo
                              TextField(),
                              showEditIcon: true,
                              placeholder: true,
                            ),
                            DataCell(//rôle
                              new DropdownButton<String>(
                                value: dropdownValue[i],
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(
                                    color: Colors.deepPurple
                                ),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue[i] = newValue;
                                  });
                                },
                                items: <String>[
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
                                ]
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                })
                                    .toList(),
                              ),
                            ),
                            DataCell(//Etat
                                Checkbox(
                                  value: etat[i],
                                  onChanged: (bool value){
                                    setState(() {
                                      etat[i] = value;
                                    });
                                  },
                                )
                            ),
                            DataCell(//Rôle donné ?
                                Checkbox(
                                  value: role[i],
                                  onChanged: (bool value){
                                    setState(() {
                                      role[i] = value;
                                    });
                                  },
                                )
                            ),
                          ]
                      );
                    }
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: RaisedButton(
                onPressed:() {
                  _pushSaved();
                },
                child: Text("Je suis un bouton"),
              ),
            ),
        ],
      ),
    )
    );
  }
   void _pushSaved() {
     Navigator.of(context).push(
       MaterialPageRoute<void>( // Add 20 lines from here...
         builder: (BuildContext context) {

           return  page3();
         },
       ),
     );
   }
}