import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_detay.dart';
import 'package:flutter_burc_rehberi/burclistesi.dart';

import 'model/burc.dart';

class RouteGenerator {
  static Route<dynamic>? routegenerator(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => BurcListesi(),
        );

      case "/burcDetay":
        final Burc secilen = settings.arguments as Burc;
        return MaterialPageRoute(
          builder: (context) => BurcDetay(secilenBurc: secilen),
        );
    }
  }
}
