import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ConnectServer extends StatelessWidget {
  const ConnectServer({Key? key}) : super(key: key);

  Future<Stream> fetchDb() async {
    final channel = await WebSocketChannel.connect(Uri.parse(
        'wss://api.baserow.io/ws/core/?jwt_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjg2MDczNjUxLCJpYXQiOjE2ODYwNzMwNTEsImp0aSI6IjYyMjg4NmY2MDIyYzRiNGY5MTI3Zjc4MzMzNDc3NTRlIiwidXNlcl9pZCI6MzQzMDF9.dDgNl47CpEoUs8WxHPD37IrUYnWh0gHMMyBG-SsVYlo'));

    return channel.stream;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: fetchDb().asStream(),
        builder: (context, snapshot) {
          return Text(
              snapshot.hasData ? '${snapshot.data}' : 'Error al conectar');
        });
  }
}
