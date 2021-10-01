# example

A new Flutter project.

## Getting Started

This is example of implementation widget at animateable package.

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
  ///create current datetime variable
  DateTime current = DateTime.now();
  ///declare late stream variable
  late final Stream<String> timer;

  @override
  void initState() {
    ///initialize timer variabel with stream periodic
    ///stream will updated every 1 seconds
    timer = Stream.periodic(const Duration(seconds: 1), (i) {
      ///update current datetime 
      current = current.add(const Duration(seconds: 1));
      /// returning new current datetime
      return 'current time is ${current.hour}:${current.minute}:${current.second}';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      ///create streambuilder and listen timer
      child: StreamBuilder<String>(
        stream: timer,
        builder: (context, snapshot) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///create crossfade widget with initial data = 'initialdata'
              ///and data from snapshot
              ///then builder will build text based on value
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


