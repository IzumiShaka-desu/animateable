<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

a package provide animation for flutter apps

## Features

- crossfade
    fades animation when data has changed

<!-- ## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package. -->

## Usage

this example usage of this packages feature. 


# `crossfade` example

```dart
import 'package:animateable/animateable.dart';
import 'package:flutter/material.dart';

class CrossFadeExample extends StatefulWidget {
  const CrossFadeExample({Key? key}) : super(key: key);

  @override
  State<CrossFadeExample> createState() => _CrossFadeExampleState();
}

class _CrossFadeExampleState extends State<CrossFadeExample> {
  DateTime current = DateTime.now();
  late final Stream<String> timer;

  @override
  void initState() {
    timer = Stream.periodic(const Duration(seconds: 1), (i) {
      current = current.add(const Duration(seconds: 1));
      return 'current time is ${current.hour}:${current.minute}:${current.second}';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: StreamBuilder<String>(
        stream: timer,
        builder: (context, snapshot) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CrossFade<String?>(
                initialData: 'initdata',
                data: snapshot.data,
                builder: (data) => Text('$data'),
              )
            ],
          );
        },
      ),
    );
  }
}


```




## Additional information

more information or need contacts me you can see [github profile](https://github.com/IzumiShaka-desu).
