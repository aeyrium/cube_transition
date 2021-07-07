import 'package:cube_transition/cube_transition.dart';
import 'package:flutter/material.dart';
import 'data.dart';

class Sample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView Cube Transition'),
      ),
      body: Center(
        child: SizedBox(
          height: height,
          child: CubePageView(
            children: places
                .map(
                  (item) => Stack(
                    children: [
                      Image.network(
                        item.url!,
                        height: height,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                spreadRadius: 5,
                                blurRadius: 5,
                              ),
                            ]),
                            child: Text(
                              item.name!,
                              style: Theme.of(context).textTheme.title,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
