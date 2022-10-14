import 'package:flutter/material.dart';
import 'package:flutter_startup/admob_page.dart';
import 'package:flutter_startup/home_page.dart';
import 'package:flutter_startup/splash_page.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize().then((InitializationStatus status) {
    print('Initialization done: ${status.adapterStatuses}');
    MobileAds.instance.updateRequestConfiguration(
      RequestConfiguration(
          tagForChildDirectedTreatment:
              TagForChildDirectedTreatment.unspecified,
          testDeviceIds: <String>["XXXXXXX"]),
    );
  });
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
        home: const AdmobPage(),
        debugShowCheckedModeBanner: false);
  }
}
