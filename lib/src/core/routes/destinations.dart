import 'package:doti_starter/index.dart';
import 'package:doti_starter/src/features/auth/presentation/auth_page.dart';
import 'package:flutter/material.dart';

const List<NavDestination> destinations = [
  // NavDestination(
  //   label: 'Home',
  //   icon: Icon(Icons.home_filled),
  //   selectedIcon: Icon(Icons.home_filled),
  //   screen: AuthPage(),
  // ),
  NavDestination(
    label: 'News',
    icon: Icon(Icons.library_books_outlined),
    selectedIcon: Icon(Icons.library_books),
    screen: NewsScreen(),
  ),
  NavDestination(
    label: 'Settings',
    icon: Icon(Icons.settings),
    selectedIcon: Icon(Icons.settings_applications),
    screen: AuthPage(),
  ),
];
