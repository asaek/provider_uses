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
        ChangeNotifierProvider(create: (_) => PruebaProvider()),
        Provider<ImageBackgroundWee>(
          create: (context) => ImageBackgroundWee(),
        )
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

class ImageBackgroundWee {
  String imageURL =
      'https://cdn-japantimes.com/wp-content/uploads/2015/05/z6-sp-expomilano1-a-20150501-e1430724912692.jpg';
}
