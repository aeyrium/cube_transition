import 'package:cube_transition/cube_transition.dart';
import 'package:flutter/material.dart';

class Sample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator Cube Transition'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Next Page'),
          onPressed: () {
            Navigator.of(context).push(
              CubePageRoute(
                enterPage: Sample1NextPage(),
                exitPage: this,
                duration: const Duration(milliseconds: 900),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Sample1NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: FlutterLogo(
          size: MediaQuery.of(context).size.width / 2,
        ),
      ),
    );
  }
}
