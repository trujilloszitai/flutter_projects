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
      onTap: onTap,
      backgroundColor: Colors.red,
      fixedColor: Colors.grey[50],
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.library_books_rounded), label: 'Libros'),
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: 'Autores',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Editoriales',
        ),
      ],
    );
  }
}
