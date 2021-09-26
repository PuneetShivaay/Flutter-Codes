import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
          home: Scaffold(
              //AppBar
              body: Center(
                child: SizedBox(
                  child: Center(
                    child: Stack(
                      children: <Widget>[

                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1547665979-bb809517610d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80'),
                                fit: BoxFit.cover),
                          ),
                        ),
                                             Positioned(
                width: 400,
                top: 100,//TRY TO CHANGE THIS **0.30** value to achieve your goal 
                child: Container(
                  color :Colors.white,
                  child: Image(image:NetworkImage(
                                    'https://upload.wikimedia.org/wikipedia/commons/9/99/Polypropylene_isotactic_mini_trp.png')),
                )
                         ),
                         
                   
                        //Container
                      ], //<Widget>[]
                    ), //Stack
                  ), //Center
                ), //SizedBox
              ) //Center
              ) //Scaffold
          ) //MaterialApp
      );
}
