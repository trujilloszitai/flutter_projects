import 'package:flutter/material.dart';

import 'package:book_catalog/widgets/navbar.dart';
import 'package:book_catalog/screens/books_list.dart';
import 'package:book_catalog/screens/authors_list.dart';
import 'package:book_catalog/screens/publishers_list.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({
    Key? key,
    this.appTitle,
    this.appTitles = const <String>[''],
    this.body,
  }) : super(key: key);

  final String? appTitle;
  final List<String> appTitles;
  final Widget? body;

  final List<Widget> indexedStack = const <Widget>[
    BooksList(),
    AuthorsList(),
    PublishersList()
  ];

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[400],
          titleTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 24,
              fontWeight: FontWeight.w500),
          title: Text(widget.appTitle ?? widget.appTitles[_selectedIndex]),
        ),
        bottomNavigationBar:
            Navbar(currentIndex: _selectedIndex, onTap: _onItemTapped),
        body: Container(
          color: Colors.grey[50],
          child: widget.body ??
              IndexedStack(
                index: _selectedIndex,
                children: widget.indexedStack,
              ),
        ));
  }
}
