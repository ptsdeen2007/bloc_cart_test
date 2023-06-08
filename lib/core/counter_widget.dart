import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  int initialCount;
  final ValueChanged<int> onChanged;

  CounterWidget({required this.initialCount, required this.onChanged});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  // late int _counter;

  void _incrementCounter() {
    setState(() {
      widget.initialCount++;
      widget.onChanged(widget.initialCount);
    });
  }

  void _decrementCounter() {
    if (widget.initialCount > 0) {
      setState(() {
        widget.initialCount--;
        widget.onChanged(widget.initialCount);
      });
    }
  }

  @override
  void initState() {
    widget.initialCount = widget.initialCount;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Center(
        child: widget.initialCount == 0
            ? TextButton(onPressed: _incrementCounter, child: Text("Add"))
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: _decrementCounter,
                  ),
                  Text(
                    '${widget.initialCount}',
                    style: TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _incrementCounter,
                  ),
                ],
              ),
      ),
    );
  }
}
