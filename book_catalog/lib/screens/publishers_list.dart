import 'package:flutter/material.dart';

class PublishersList extends StatefulWidget {
  const PublishersList({Key? key}) : super(key: key);

  @override
  _PublishersListState createState() => _PublishersListState();
}

class _PublishersListState extends State<PublishersList> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Lista de editoriales"));
  }
}
