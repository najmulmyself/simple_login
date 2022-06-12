import 'package:flutter/material.dart';
import 'package:new_version/new_version.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    checkUpdate();

    // TODO: implement initState
  }

  void checkUpdate() async {
    final newVersion = NewVersion(androidId: "com.snapchat.android");
    final status = await newVersion.getVersionStatus();
    newVersion.showUpdateDialog(
      context: context,
      versionStatus: status!,
      dialogTitle: 'Update',
      dialogText: 'Please Update',
      dismissButtonText: 'skip',
    );
    print('Device :' + status.localVersion);
    print('Store : ' + status.storeVersion);
  }
  // newVersion.showAlertIfNecessary(context: context);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
