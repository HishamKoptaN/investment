import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class MyAppCal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  String result = '';
  List<Map<String, dynamic>> operations = [];

  @override
  void initState() {
    super.initState();
    _loadOperations();
  }

  void _loadOperations() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('operations');
    if (data != null) {
      setState(
        () {
          operations = List<Map<String, dynamic>>.from(json.decode(data));
        },
      );
    }
  }

  void _saveOperation(
      String operation, double num1, double num2, double result) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('operations');
    List<Map<String, dynamic>> ops = [];
    if (data != null) {
      ops = List<Map<String, dynamic>>.from(json.decode(data));
    }
    ops.add({
      'id': DateTime.now().millisecondsSinceEpoch,
      'operation': operation,
      'num1': num1,
      'num2': num2,
      'result': result,
    });
    await prefs.setString('operations', json.encode(ops));
    _loadOperations();
  }

  void _calculate(String operation) {
    double num1 = double.parse(num1Controller.text);
    double num2 = double.parse(num2Controller.text);
    double result;
    switch (operation) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = num1 / num2;
        break;
      default:
        result = 0.0;
        break;
    }
    setState(() {
      this.result = result.toString();
    });
    _saveOperation(operation, num1, num2, result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter number 1'),
            ),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter number 2'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('*'),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('/'),
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Result: $result', style: const TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HistoryPage(operations)),
                );
              },
              child: const Text('History Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> operations;

  HistoryPage(this.operations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: ListView.builder(
        itemCount: operations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Operation: ${operations[index]['operation']}'),
            subtitle: Text('Result: ${operations[index]['result']}'),
          );
        },
      ),
    );
  }
}
