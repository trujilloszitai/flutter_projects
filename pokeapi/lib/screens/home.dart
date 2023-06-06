import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pokeapi/api/pokeapi.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  get pokemonList => null;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiCall().getPokemon(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Se ha producido un error"),
                );
              } else {
                var pokemonList = snapshot.data["results"];
                return Center(
                  child: Text(pokemonList.toString()),
                );
                /* return ListView.builder(
                  itemCount: pokemonList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(pokemonList[index]["name"]),
                    );
                  },
                ); */
              }
          }
        });
  }
}
