import 'package:flutter/material.dart';
import 'package:visualising_sorting_algos/providers/algo_provider.dart';
import 'package:visualising_sorting_algos/widgets/scaffold_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

class BogoSort extends ConsumerStatefulWidget {
  const BogoSort({super.key});

  @override
  ConsumerState<BogoSort> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<BogoSort> {
  void bogoSortRecursive() async {
    if (!ref.read(playProvider)) {
      return;
    }
    final list = ref.read(algoProvider);
    final arr = <int>[...list];

    arr.shuffle();
    ref.read(algoProvider.notifier).updateList(arr);
    await Future.delayed(Duration(milliseconds: ref.read(delayProvider)));
    if (arr.isSorted((a, b) => a.compareTo(b))) {
      return;
    }
    bogoSortRecursive(); // Use item3 to access the third element of the tuple
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBody(
      title: 'Bogo Sort',
      onStart: () {
        bogoSortRecursive();
      },
    );
  }
}
