import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkbox Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Map to keep track of the checked states of the checkboxes
  Map<String, bool> _isChecked = {
    'Option 1': false,
    'Option 2': false,
    'Option 3': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Select your options:',
              style: TextStyle(fontSize: 18.0),
            ),
            ..._isChecked.keys.map((String key) {
              return CheckboxListTile(
                title: Text(key),
                value: _isChecked[key],
                onChanged: (bool? newValue) {
                  setState(() {
                    _isChecked[key] = newValue ?? false;
                  });
                },
              );
            }).toList(),
            SizedBox(height: 20.0),
            Text(
              'Selected options: ${_isChecked.entries.where((entry) => entry.value).map((entry) => entry.key).join(', ')}',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
