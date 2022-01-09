import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemonflutter/providers/App.state.dart';

class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget{
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      return  Container(
        height: 80,
        color: Color.fromARGB(255, 211, 32, 32),
        child: Row(
            children: <Widget>[
              const Text('Pokeymoney : ',
              style:TextStyle(fontFamily: 'Montserrat', fontSize:20, color: (Colors.white)),
              ),
              Text(ref.watch(appStateProvider).pokemoney.toString(),
              style:TextStyle(fontFamily: 'Montserrat', fontSize:20, color: (Colors.white)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0), 
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, 
                ),
              child: Icon(Icons.settings),
              onPressed: () {
                _navigateToNextScreen(context);
              })),
            ],

          ),
      )
      ;
  }
  @override
  Size get preferredSize => const Size.fromHeight(64);

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewScreen()));
  }
}


class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Paramètres')),
      body: Center(
        child: Text(
          'Vous êtes sur la page paramètres en cours de modification',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
  
}