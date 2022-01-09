import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemonflutter/providers/home.state.dart';

class HomeBottomBar extends ConsumerWidget {
  const HomeBottomBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Boutique',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.catching_pokemon_rounded),
            label: 'Mon Pokemon',
          ),
        ],
        currentIndex: ref.watch(homeStateProvider).currentTab,
        selectedItemColor: Colors.amber[800],
        onTap: (index){
          ref.read(homeStateProvider.notifier).setTab(index);
        },
      );
  }
}