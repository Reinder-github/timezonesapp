import 'package:flutter/material.dart';
import 'package:klok/paginas/home.dart';
import 'package:klok/paginas/kies_locatie.dart';
import 'package:klok/paginas/laad.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const laad(),
    '/home': (context) => const Home(),
    '/locatie':(context) => const KiesLocatie()
  }
));