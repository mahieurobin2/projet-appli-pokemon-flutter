import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemonflutter/models/get_list_pokemon.dart';
import 'package:pokemonflutter/models/result.dart';
import 'package:pokemonflutter/providers/list_pokemon.provider.dart';

import '../../../../../providers/App.state.dart';

class Boutique extends ConsumerWidget {
  const Boutique({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(listPokemonProvider)
        .map(data: _data, error: _error, loading: _loading);
  }

  Widget _error(AsyncError<GetListPokemonResponse?> error) {
    return Text('Impossible de charger les pokémons');
  }

  Widget _loading(AsyncLoading<GetListPokemonResponse?> loading) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _data(AsyncData<GetListPokemonResponse?> data) {
    final GetListPokemonResponse? value = data.value;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Wrap(
            children: value!.results!.map((e) => _OnePokemon(pokemon: e)).toList(),
          ),
        ),
      ),
    );
  }
}

class _OnePokemon extends ConsumerWidget {
  const _OnePokemon({Key? key, required this.pokemon}) : super(key: key);

  final Result pokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //-----
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
          border: Border.all(
                    color: Colors.black,
                    width: 1,
        )),
        width: MediaQuery.of(context).size.width * 0.40,
        height: MediaQuery.of(context).size.height * 0.30,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(pokemon.name!,
              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20, fontFamily: 'Montserrat'),
            ))),
            Image.asset('images/pokeball.png',
            width: 100,
            height: 100),
            // Expanded(
              // child: Column(
                // children: [
                  Expanded(child:Container(
                    height: 150.0,
                    margin: const EdgeInsets.only(top:20.0, bottom: 20.0),
                    child: ButtonTheme(
                      height: 150.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                      child:MaterialButton(
                        onPressed: () {
                          if(ref.watch(appStateProvider).pokemoney > 9){
                            showDialog(context: context, builder: (contect)=>AlertDialog(
                            title: Text('Achat effectué'),
                            content: Text("Vous venez d'acheter un Pokémon"),
                            actions: [
                              TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("ok"),)  
                            ],

                          ));
                          ref.read(appStateProvider.notifier).acheter();
                          }
                          else{
                             showDialog(context: context, builder: (contect)=>AlertDialog(
                            title: Text('Achat impossible'),
                            content: Text("Vous N'avez pas assez de pokemoney, un minimum de 10 unités est suggéré."),
                            actions: [
                              TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("ok"),)  
                            ],

                          ));
                          }
                          
                        },
                        padding: EdgeInsets.all(0),
                        
                        color: Color.fromARGB(255, 15, 156, 238),
                        textColor: Colors.white,
                        child: Text("Acheter",
                            style: TextStyle(fontSize: 15)),
                      )
                    
                  ),)
                  ) 
                  
                // ],
              // ),
            // ),
          ],
        ),
      ),
    );
  }
}
