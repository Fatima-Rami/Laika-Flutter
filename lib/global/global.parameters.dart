import 'package:flutter/material.dart';

class GlobalParameters{
  static final menu = [
    {
      'title': 'Home',
      'route': '/',
      'icon': Icon(Icons.home)
    },
    {
      'title': 'Mes Animaux',
      'route': '/animaux',
      'icon': Icon(Icons.pets)
    },
    {
      'title': 'Contact',
      'route': '/contact',
      'icon': Icon(Icons.contacts)
    },
  ];
}