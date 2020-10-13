import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Observer(
        builder: (BuildContext context) {
          if (homeController.pokemons.error != null) {
            return Center(
              child: RaisedButton(
                child: Text('Press Again'),
                onPressed: () {
                  homeController.fetchPokemons();
                },
              ),
            );
          }
          if (homeController.pokemons.value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var pokemons = homeController.pokemons.value;
          return ListView.builder(
            itemCount: pokemons.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(pokemons[index].name),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //Navigator.pushNamed(context, '/other/${homeController.text}');
          Modular.to.pushNamed('/other');
        },
      ),
    );
  }
}
