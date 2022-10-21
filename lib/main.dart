import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String? title;

  MyHomePage({this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _batterLevel= 0;
  Future<void> _getBatteryLevel() async {
    const platform = MethodChannel(
        'course.flutter.dev/battery'); // just a uniqque identifier
    try {
      final betteryLevel = await platform.invokeMethod('getBetteryLevel');
      setState(() {
        _batterLevel = _batterLevel;
      });
    }on PlatformException catch (err) {
      setState(() {
        _batterLevel=null as int;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toString()),
      ),
      body: Center(
        child: Text('This is battery level : $_batterLevel'),
      ),
    );
  }
}
