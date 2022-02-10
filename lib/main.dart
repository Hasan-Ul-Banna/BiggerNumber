import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: bigNum(),
  ));
}

class bigNum extends StatefulWidget {
  @override
  _bigNumState createState() => _bigNumState();
}

class _bigNumState extends State<bigNum> {
  int leftBtn = 0;
  int rightBtn = 0;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Bigger Number Game!',
          style: TextStyle(
            color: Colors.white70,
            letterSpacing: 2.0,
            fontWeight: FontWeight.bold,
          ),
        )),
        backgroundColor: Colors.brown[700],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 0.0),
            child: Text(
              'Press the button of the larger number. If you get it right you will get a point! If you get it wrong , you will lose a point.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[400],
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 170.0),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    check('left');
                  },
                  child: Text(
                    randomNumber('left').toString(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    check('right');
                  },
                  child: Text(
                    randomNumber('right').toString(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 200.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Points: ',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.lightGreen[300],
                  letterSpacing: 1.0,
                ),
              ),
              Text(
                '$score',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.lightGreen[300],
                  letterSpacing: 1.0,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  int randomNumber(String btn) {
    if (btn == 'left') {
      setState(() {
        leftBtn = Random().nextInt(9);
      });
      return leftBtn;
    } else if (btn == 'right') {
      setState(() {
        rightBtn = Random().nextInt(9);
        while (leftBtn == rightBtn) {
          rightBtn = Random().nextInt(9);
        }
      });
      return rightBtn;
    }
    return 0;
  }

  void check(String pressedBtn) {
    if (pressedBtn == 'left') {
      if (leftBtn > rightBtn) {
        setState(() {
          score += 1;
        });
      } else {
        setState(() {
          score -= 1;
        });
      }
    } else if (pressedBtn == 'right') {
      if (rightBtn > leftBtn) {
        setState(() {
          score += 1;
        });
      } else {
        setState(() {
          score -= 1;
        });
      }
    }
  }
}
