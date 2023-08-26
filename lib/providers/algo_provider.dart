import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberOfBoxesProvider = StateProvider<int>((ref) {
  return 20;
});

final playProvider = StateProvider<bool>((ref) {
  return true;
});

final delayProvider = StateProvider<int>((ref) {
  return 25;
});

final algoProvider = StateNotifierProvider<AlgoProvider, List<int>>((ref) {
  final indexList = ref.watch(numberOfBoxesProvider);
  final list = List<int>.generate(indexList, (index) => index);
  return AlgoProvider(ref, list);
});

class AlgoProvider extends StateNotifier<List<int>> {
  final Ref ref;
  final List<int> list;
  AlgoProvider(this.ref, this.list) : super(list);

  void updateList(List<int> newList) {
    state = newList;
  }
}
