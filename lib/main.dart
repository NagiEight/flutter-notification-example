import 'package:flutter/material.dart';
import 'services/noti_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotiService.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome Notifications Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    NotiService.requestPermission();
  }

  void _sendNotification() {
    NotiService.showNotification(
      title: 'Hey Nagi 👑',
      body: 'Your awesome notification just arrived!',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Awesome Notifications')),
      body: Center(
        child: ElevatedButton(
          onPressed: _sendNotification,
          child: Text('Send Notification'),
        ),
      ),
    );
  }
}
