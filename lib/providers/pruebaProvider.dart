import 'package:flutter/material.dart';

class PruebaProvider with ChangeNotifier {
  int _tamano = 1;
  bool _colorTema = false;

  int getTamano() => _tamano;
  void setTamano(int dato) {
    _tamano = dato;
    notifyListeners();
  }

  bool getColorTema() => _colorTema;
  void setColorTema(bool dato) {
    _colorTema = dato;
    notifyListeners();
  }
}
