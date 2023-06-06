import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class NumberStepper extends StatelessWidget {
  const NumberStepper({super.key});

  @override
  Widget build(BuildContext context) {
    var space = const SizedBox(
      width: 3,
    );
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 227, 130, 102),
                  child: Text('1'),
                ),
                const Expanded(child: DottedLine()),
                space,
                const CircleAvatar(
                  child: Text('2'),
                ),
                const Expanded(child: DottedLine()),
                space,
                const CircleAvatar(
                  child: Text('3'),
                ),
                const Expanded(child: DottedLine()),
                space,
                const CircleAvatar(
                  child: Text('4'),
                ),
                const Expanded(child: DottedLine()),
                space,
                const CircleAvatar(
                  child: Text('5'),
                ),
                space,
              ],
            ),
          )
        ],
      ),
    );
  }
}
