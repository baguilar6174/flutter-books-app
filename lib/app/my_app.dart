import 'package:books_app/app/ui/routes/app_routes.dart';
import 'package:books_app/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      routes: routes,
    );
  }
}
