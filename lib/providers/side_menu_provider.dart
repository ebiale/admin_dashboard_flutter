import 'package:flutter/material.dart';

class SideMenuProvider {
  static late AnimationController menuControler;
  static bool isOpen = false;

  static Animation<double> movement = Tween<double>(begin: -200, end: 0)
      .animate(CurvedAnimation(parent: menuControler, curve: Curves.easeInOut));

  static Animation<double> opacity = Tween<double>(begin: 0, end: 1)
      .animate(CurvedAnimation(parent: menuControler, curve: Curves.easeInOut));

  static void openMenu() {
    isOpen = true;
    menuControler.forward();
  }

  static void closeMenu() {
    isOpen = false;
    menuControler.reverse();
  }

  static void toggleMenu() {
    isOpen ? menuControler.reverse() : menuControler.forward();
    isOpen = !isOpen;
  }
}
