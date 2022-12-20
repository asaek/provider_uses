import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_casos/main.dart';
import 'package:provider_casos/providers/providers.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Center(
              child: Text('Ejemplo'),
            ),
            Consumer<PruebaProvider>(
              builder: (context, pruebaProvidedr, child) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
                    width: pruebaProvidedr.getTamano().toDouble(),
                    color: Colors.amber,
                  ),
                  Container(
                    height: 300,
                    width: size.width - pruebaProvidedr.getTamano(),
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
            _Slider(),
            _SwitchTitle(),
            const SizedBox(
              height: 20,
            ),
            _ImageAvatar(),
          ],
        ),
      ),
    );
  }
}

class _ImageAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Consumer<ImageBackgroundWee>(
        builder: (BuildContext context, imageBackgroundWee, Widget? child) =>
            CircleAvatar(
          radius: 150,
          backgroundImage: NetworkImage(imageBackgroundWee.imageURL),
        ),
      ),
    );
  }
}

class _SwitchTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final valorTema = Provider.of<PruebaProvider>(context).getColorTema();

    return Consumer<PruebaProvider>(
      builder: (context, pruebaProvider, child) => SwitchListTile(
          title: const Text(
            'Hola bb cambio tema',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          value: pruebaProvider.getColorTema(),
          onChanged: (bool newValue) {
            pruebaProvider.setColorTema(newValue);

            // Provider.of<PruebaProvider>(context, listen: false)
            //     .setColorTema(newValue);
          }),
    );
  }
}

class _Slider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<PruebaProvider>(
      builder: (context, pruebaProvider, child) => Slider(
        value: pruebaProvider.getTamano().toDouble(),
        min: 0,
        max: size.width,
        // divisions: 10,
        onChanged: (double valor) {
          pruebaProvider.setTamano(
            valor.toInt(),
          );
        },
      ),
    );
  }
}
