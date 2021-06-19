import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_admin_panel_template/main_page.dart';
import 'package:web_admin_panel_template/provider/public_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>PublicProvider())
      ],
      child: MaterialApp(
        title: 'Dhaka Fiber Link LTD',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage(),
      ),
    );
  }
}