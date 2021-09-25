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
