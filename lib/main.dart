import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/pruebaProvider.dart';
import 'screens/screens.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PruebaProvider(),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final colortema =
    //     Provider.of<PruebaProvider>(context, listen: true).getColorTema();
    return Consumer<PruebaProvider>(
      builder: (context, value, child) => MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: Pagina1Page(),
        theme: (value.getColorTema()) ? ThemeData.light() : ThemeData.dark(),
      ),
    );
  }
}
