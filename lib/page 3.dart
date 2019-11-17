
import 'package:flutter/material.dart';


class page3 extends StatefulWidget {
  page3({
    Key key,
  }) : super(key: key);

  @override
  _page3State createState() => _page3State();

}
class _page3State extends State<page3>
  with TickerProviderStateMixin {
  AnimationController controller;
  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60)
        .toString()
        .padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(minutes: temps),
    );
  }

  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  int temps = 1;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Minuteur"),
        ),
        body:
        AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.amber,
                      height:
                      controller.value * MediaQuery.of(context).size.height,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: FractionalOffset.center,
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: Stack(
                                children: <Widget>[
//                                  Positioned.fill(
//                                    child: CustomPaint(
//                                        painter: CustomTimerPainter(
//                                          animation: controller,
//                                          backgroundColor: Colors.white,
//                                          color: Colors.purple,
//                                        )),
//                                  ),
                                  Align(
                                    alignment: FractionalOffset.center,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: <Widget>[
                                        TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                          controller: myController,
                                        ),
                                        RaisedButton(
                                          onPressed: (){
                                            setState(() {
                                              temps = int.parse(myController.text);
                                              controller = AnimationController(
                                                vsync: this,
                                                duration: Duration(minutes: temps),
                                              );
                                            });
                                          },
                                          child: Text("Je suis un bouton"),
                                        ),
                                        Text(
                                          timerString,
                                          style: TextStyle(
                                              fontSize: 112.0,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AnimatedBuilder(
                            animation: controller,
                            builder: (context, child) {
                              return FloatingActionButton.extended(
                                  onPressed: () {
                                    if (controller.isAnimating)
                                      controller.stop();
                                    else {
                                      controller.reverse(
                                          from: controller.value == 0.0
                                              ? 1.0
                                              : controller.value);
                                    }
                                  },
                                  icon: Icon(controller.isAnimating
                                      ? Icons.pause
                                      : Icons.play_arrow),
                                  label: Text(
                                      controller.isAnimating ? "Pause" : "Play"));
                            }),
                      ],
                    ),
                  ),
                ],
              );
            }),
    );
  }

}