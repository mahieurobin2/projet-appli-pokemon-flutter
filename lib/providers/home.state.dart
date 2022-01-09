import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeStateProvider = StateNotifierProvider<HomeStateNotifier, HomeState>((ref) {
    return HomeStateNotifier();
});

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier() : super(HomeState());

  void setTab(index){
    var newState = HomeState();
    newState.currentTab = index;
    state = newState;
  }


}

class HomeState {
  int currentTab = 1;
}