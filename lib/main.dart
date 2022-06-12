import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_version/new_version.dart';
import 'package:simple_login/home_page.dart';
import 'package:simple_login/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // _checkVersion();
  }

  void _checkVersion() async {
    final newVersion = NewVersion(
      androidId: "com.snapchat.android",
    );
    final status = await newVersion.getVersionStatus();
    newVersion.showUpdateDialog(
      context: context,
      versionStatus: status!,
      dialogTitle: "UPDATE!!!",
      dismissButtonText: "Skip",
      dialogText: "Please update the app from " +
          "${status.localVersion}" +
          " to " +
          "${status.storeVersion}",
      dismissAction: () {
        SystemNavigator.pop();
      },
      updateButtonText: "Lets update",
    );

    print("DEVICE : " + status.localVersion);
    print("STORE : " + status.storeVersion);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/homepage/': (context) => HomePage(),
      },
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: LoginPage(),
      ),
    );
  }
}
