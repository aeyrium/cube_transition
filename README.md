# Cube Transition

[![pub package](https://img.shields.io/pub/v/cube_transition.svg)](https://pub.dev/packages/cube_transition)

A 3D Cube transition for your PageView and PageRoute.

<p>
<a href="https://aeyrium.com/" target="_blank"><img src="https://drive.google.com/uc?id=1TP33E66rwZ6wsbaO3vw7PqrMFY2sgZxE" width="500px"
alt="Aeyrium Inc. is a provider of innovative software solutions for the business and commercial aviation"/></a>
</p>
</p>

## Features

- Use the cube transition between the navigation of your pages.
- Add cube transitions to your PageView.
- Add custom transformation in your items of your PageView.


## Getting started

You should ensure that you add the dependency in your flutter project.

```yaml
dependencies:
  cube_transition: "^1.0.0"
```

Import the package:

```
import 'package:cube_transition/cube_transition.dart';
```

You should then run `flutter packages upgrade` or update your packages in IntelliJ.

## Example Project

There is a example project in the `example` folder. Check it out. Otherwise, keep reading to get up and running.

## Usage

**Navigator Cube Transition**

```dart
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
```

<p align="center">
  <img src="https://media.giphy.com/media/QaZ24HB4zgl40GMd0k/giphy.gif">
</p>

**PageView Cube Transition (default)**

```dart
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
                  (item) =>  Image.network(
                        item.url,
                        height: height,
                        fit: BoxFit.cover,
                      ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

```

<p align="center">
  <img src="https://media.giphy.com/media/lnOUMeIqrtosHMc0vM/giphy.gif">
</p>

**PageView Cube Transition Custom**

```dart
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

```

<p align="center">
  <img src="https://media.giphy.com/media/SUoqVxRxNLRAaqo6u5/giphy.gif">
</p>



Copyright [Aeyrium Inc](https://aeyrium.com/)

You can follow me on twitter [@diegoveloper](https://www.twitter.com/diegoveloper)
