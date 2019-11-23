// WelcomeScreen.dart

import 'package:flutter/material.dart';
import 'dart:math';

class Statistic extends StatefulWidget {
  @override
  _StatisticState createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  Widget build(BuildContext context) {

    Text textStyle(text) {
      return Text(text,
        style: TextStyle(fontSize: 20.0),
        textAlign: TextAlign.center,
      );
    }

    Expanded icon(cas){
      cas *= 10;
      switch(cas){
        case 10:
          return Expanded(
            flex: 1,
            child: Icon(
              Icons.arrow_upward, size: 25.0,
            ),
          );
        case 5:
          return Expanded(
            flex: 1,
            child: Icon(
              Icons.call_made, size: 25.0,
            ),
          );
        case 0:
          return Expanded(
            flex: 1,
            child: Icon(
              Icons.arrow_forward, size: 25.0,
            ),
          );
        case -5:
          return Expanded(
            flex: 1,
            child: Transform.rotate(
              angle: 90 * pi / 180,
              child: Icon(
                Icons.call_made, size: 25.0,
              ),
            ),
          );
        case -10:
          return Expanded(
            flex: 1,
            child: Icon(
              Icons.arrow_downward, size: 25.0,
            ),
          );
        default:
          return Expanded(
            flex: 1,
            child: Icon(
              Icons.trip_origin, size: 25.0,
            ),
          );
      }
    }

    Container items(time, value, cas) {
      return Container(
        margin: EdgeInsets.only(top: 5.0),
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.2)),
            )
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: textStyle(time),
            ),
            Expanded(
              flex: 1,
              child: textStyle(value),
            ),
            icon(cas)
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Statistika'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text('Čas', style: TextStyle(fontSize: 28.0), textAlign: TextAlign.center,),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('Hodnota', style: TextStyle(fontSize: 28.0), textAlign: TextAlign.center,),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('Změna',  style: TextStyle(fontSize: 28.0), textAlign: TextAlign.center,),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 200.0,
                  child: ListView(
                    children: <Widget>[
                      items('18:52', '14,3', -1.0),
                      items('17:32', '17,3', 1.0),
                      items('16:52', '14,3', -0.5),
                      items('16:02', '16,3', 0.0),
                      items('15:52', '16,3', 0.5),
                      
                    ],
                  ),
                )
              )
            ],
          ),
        )
    );
  }
}