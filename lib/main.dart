import 'package:flutter/material.dart';
import 'package:gotobun_app/router/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: const Color.fromRGBO(248, 187, 208, 0.7)),
    );
  }
}
