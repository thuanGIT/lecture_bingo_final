import 'package:flutter/material.dart';
import 'package:lecture_bingo/page_3.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:flip_card/flip_card.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Lecture Bingo'),
      ),
      body: GamePage(),
    );
  }
}

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Align(
            alignment: Alignment(0.0, 0.3),
            child: Container(
              child: Text(
                'Math is fun !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: BingoTable(),
        ),
        Flexible(
          flex: 1,
          child: Timer(),
        ),
      ],
    );
  }
}

class Timer extends StatelessWidget {
  final int maxTime = 10;
  final int breakTime = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Countdown(
        seconds: maxTime,
        build: (BuildContext context, double time) => Text(
          time.toString(),
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        interval: Duration(milliseconds: 100),
        onFinished: () {
          Navigator.push(
            context,
            new MaterialPageRoute<void>(
                builder: (BuildContext context) => ThirdPage(
                      breakTime: breakTime,
                    )),
          );
        },
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blueGrey[300],
        border: Border.all(
          color: Colors.black87,
        ),
      ),
    );
  }
}

class BingoTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BingoTableState();
  }
}

class BingoTableState extends State<BingoTable> {
  List<bool> gameState;
  List<Marker> options;
  List<Image> images;

  Data data = new Data();
  Image blank = Image(
    image: AssetImage('images/done.png'),
  );

  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
      ];

      this.images = [
        Image(
          image: AssetImage('images/def_formula.png'),
        ),
        Image(
          image: AssetImage('images/area_between_curves.png'),
        ),
        Image(
          image: AssetImage('images/definition.png'),
        ),
        Image(
          image: AssetImage('images/disk_method_integration.png'),
        ),
        Image(
          image: AssetImage('images/example_1.png'),
        ),
        Image(
          image: AssetImage('images/graph_def.png'),
        ),
        Image(
          image: AssetImage('images/riemann_graph.png'),
        ),
        Image(
          image: AssetImage('images/substitution_rule.png'),
        ),
        Image(
          image: AssetImage('images/trapezoid_rule.png'),
        ),
      ];

      this.options = [
        Marker(front: images[0], back: blank),
        Marker(front: images[1], back: blank),
        Marker(front: images[2], back: blank),
        Marker(front: images[3], back: blank),
        Marker(front: images[4], back: blank),
        Marker(front: images[5], back: blank),
        Marker(front: images[6], back: blank),
        Marker(front: images[7], back: blank),
        Marker(front: images[8], back: blank),
      ];
    });
  }

  checkBingo() {
    if ((gameState[0] && gameState[1] && gameState[2]) ||
        (gameState[3] && gameState[4] && gameState[5]) ||
        (gameState[6] && gameState[7] && gameState[8]) ||
        (gameState[0] && gameState[3] && gameState[6]) ||
        (gameState[1] && gameState[4] && gameState[7]) ||
        (gameState[2] && gameState[5] && gameState[8]) ||
        (gameState[0] && gameState[4] && gameState[8]) ||
        (gameState[2] && gameState[4] && gameState[6])) {
      // if any user Win update the message state
      setState(() {
        data.bingo = true;
        data.breakTime *= 2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            color: Colors.black87,
            width: 2,
            style: BorderStyle.none,
          ),
        ),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: Colors.black87,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              padding: const EdgeInsets.all(4),
              child: options[0],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: Colors.black87,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              padding: const EdgeInsets.all(4),
              child: options[1],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: Colors.black87,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              padding: const EdgeInsets.all(4),
              child: options[2],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: Colors.black87,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              padding: const EdgeInsets.all(4),
              child: options[3],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: Colors.black87,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              padding: const EdgeInsets.all(4),
              child: options[4],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: Colors.black87,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              padding: const EdgeInsets.all(4),
              child: options[5],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: Colors.black87,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              padding: const EdgeInsets.all(4),
              child: options[6],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: Colors.black87,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              padding: const EdgeInsets.all(4),
              child: options[7],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: Colors.black87,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              padding: const EdgeInsets.all(4),
              child: options[8],
            ),
          ],
        ),
      ),
    );
  }
}

class Data {
  bool bingo;
  int breakTime = 10;
  Data({this.bingo, this.breakTime});
}

class Marker extends StatefulWidget {
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  final Image front;
  final Image back;
  Marker({Key key, this.front, this.back}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MarkerState();
  }
}

class MarkerState extends State<Marker> {
  @override
  Widget build(BuildContext context) {
    /*
    return FlipCard(
      key: widget.cardKey,
      flipOnTouch: false,
      front: Container(
        child: GestureDetector(
          onTap: () => widget.cardKey.currentState.toggleCard(),
          child: widget.front,
        ),
      ),
      back: Container(
        child: GestureDetector(
          onTap: () => widget.cardKey.currentState.toggleCard(),
          child: widget.back,
        ),
      ),
    );*/

    return FlipCard(
      direction: FlipDirection.HORIZONTAL, // default
      front: Container(
        child: widget.front,
      ),
      back: Container(
        child: widget.back,
      ),
    );
  }
}
