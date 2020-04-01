import 'dart:ui';

import 'package:cube_transition/cube_transition.dart';
import 'package:flutter/material.dart';
import 'data.dart';

class Sample3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Cube Transition'),
      ),
      body: Center(
        child: SizedBox(
          height: height,
          child: CubePageView.builder(
            itemCount: places.length,
            itemBuilder: (context, index, notifier) {
              final item = places[index];
              final transform = Matrix4.identity();
              final t = (index - notifier).abs();
              final scale = lerpDouble(1.5, 0, t);
              transform.scale(scale, scale);
              return CubeWidget(
                index: index,
                pageNotifier: notifier,
                child: Stack(
                  children: [
                    Image.network(
                      item.url,
                      height: height,
                      fit: BoxFit.cover,
                    ),
                    Transform(
                      alignment: Alignment.center,
                      transform: transform,
                      child: Center(
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
                              item.name.split('-').join('\n'),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.title,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
