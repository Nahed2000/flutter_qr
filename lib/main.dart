import 'package:flutter/material.dart';
import 'package:flutter_qr/style/ui_style.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppStyle.primaryColor,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QrImage(
              data: data,
              size: 300.0,
              version: QrVersions.auto,
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              alignment: Alignment.center,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Type The Data  ',
                  filled: true,
                  fillColor: AppStyle.textInputColor,
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    data = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Generate QR Code'),
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(color: AppStyle.primaryColor.withOpacity(0.3)),
                primary: Colors.blue[200]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
