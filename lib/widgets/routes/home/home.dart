import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemonflutter/providers/home.state.dart';
import 'package:pokemonflutter/widgets/routes/home/local_widgets/home_appbar.dart';
import 'package:pokemonflutter/widgets/routes/home/local_widgets/home_bottombar.dart';
import 'package:pokemonflutter/widgets/routes/home/local_widgets/monPokemon/mon_pokemon.dart';

import 'local_widgets/boutique/boutique.dart';
import 'local_widgets/home/home.dart';

class HomeRoute extends ConsumerWidget {
  HomeRoute({ Key? key }) : super(key: key);

  final tabs = [const Boutique(), const Home(), const MonPokemon()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: tabs[ref.watch(homeStateProvider).currentTab],
      bottomNavigationBar: const HomeBottomBar(),
    );
  }
}