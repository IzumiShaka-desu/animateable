import 'package:flutter/material.dart';

import 'widgets/cross_fade_example.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Example of animateable',
        ),
      ),
      body: ListView(
        itemExtent: 80,
        children: const [
          ///this listtile item is example of crossfade
          ListTile(
            title: Text('CrossFade'),
            subtitle: CrossFadeExample(),
          ),
        ],
      ),
    );
  }
}
