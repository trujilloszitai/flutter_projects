import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      backgroundColor: Colors.red,
      onTap: onTap,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_books_rounded), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Autores'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Editoriales'),
      ],
    );
  }
}
