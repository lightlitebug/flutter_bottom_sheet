import 'package:flutter/material.dart';

import 'package:bottom_sheet/modal_bottom_sheet.dart';
import 'package:bottom_sheet/persistent_bottom_sheet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Sheet Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Sheet Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              color: Colors.indigo,
              textColor: Colors.white,
              minWidth: 220,
              height: 45,
              child: Text(
                'Modal Bottom Sheet',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) {
                    return ModalBottomSheet();
                  }),
                );
              },
            ),
            SizedBox(height: 20),
            MaterialButton(
              color: Colors.indigo,
              textColor: Colors.white,
              minWidth: 220,
              height: 45,
              child: Text(
                'Persistent Bottom Sheet',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) {
                    return PersistentBottomSheet();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
