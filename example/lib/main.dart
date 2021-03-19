import 'package:flutter/material.dart';
import 'package:ranked_list/ranked_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ranked List Example'),
      ),
      body: SafeArea(
        child: RankedList(
          itemBuilder: (context, index) {
            return Container(
              color: index + 1 == 25 ? Colors.green : Colors.white,
              child: ListTile(
                title: Text(
                  '${index + 1}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            );
          },
          itemCount: 50,
          rank: 25,
          itemHeight: 56,
          topItem: Container(
            color: Colors.green,
            child: ListTile(
              title: Text(
                '25',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          bottomItem: Container(
            color: Colors.green,
            child: ListTile(
              title: Text(
                '25',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          showBottom: false,
        ),
      ),
    );
  }
}
