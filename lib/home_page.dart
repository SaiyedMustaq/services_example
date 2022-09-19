import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:servicesexample/permissions_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton.icon(
              onPressed: () {
                PermissionsService()
                    .requestPermission(context, Permission.camera);
              },
              label: Text("Request For Camera Access"),
              icon: Icon(Icons.camera),
            ),
            OutlinedButton.icon(
                onPressed: () {
                  PermissionsService()
                      .requestPermission(context, Permission.location);
                },
                label: Text("Request For Location Access"),
                icon: Icon(Icons.map)),
          ],
        ),
      ),
    );
  }
}
