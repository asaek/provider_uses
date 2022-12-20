import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_casos/providers/providers.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final valorActual =
        Provider.of<PruebaProvider>(context, listen: true).getTamano();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Center(
              child: Text('Ejemplo'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: valorActual.toDouble(),
                  color: Colors.amber,
                ),
                Container(
                  height: 300,
                  width: size.width - valorActual,
                  color: Colors.blueAccent,
                ),
              ],
            ),
            _Slider(),
            _SwitchTitle(),
          ],
        ),
      ),
    );
  }
}

class _SwitchTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final valorTema = Provider.of<PruebaProvider>(context).getColorTema();
    return SwitchListTile(
      title: const Text(
        'Hola bb cambio tema',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      value: valorTema,
      onChanged: (bool newValue) =>
          Provider.of<PruebaProvider>(context, listen: false)
              .setColorTema(newValue),
    );
  }
}

class _Slider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final valorActual =
        Provider.of<PruebaProvider>(context, listen: true).getTamano();
    final size = MediaQuery.of(context).size;
    return Consumer<PruebaProvider>(
      builder: (context, value, child) => Slider(
        value: value.getTamano().toDouble(),
        min: 0,
        max: size.width,
        // divisions: 10,
        onChanged: (double valor) {
          Provider.of<PruebaProvider>(context, listen: false)
              .setTamano(valor.toInt());
        },
      ),
    );
  }
}
