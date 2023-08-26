import 'package:flutter/material.dart';
import 'package:visualising_sorting_algos/providers/algo_provider.dart';
import 'package:visualising_sorting_algos/widgets/scaffold_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuickSort extends ConsumerStatefulWidget {
  const QuickSort({super.key});

  @override
  ConsumerState<QuickSort> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<QuickSort> {
  Future<List<int>?> quickSort(List<int> arr) async {
    if (!ref.read(playProvider)) {
      return null;
    }
    if (arr.length <= 1) {
      return arr;
    }

    final pivot = arr[arr.length ~/ 2];
    final left = <int>[];
    final middle = <int>[];
    final right = <int>[];

    for (var i = 0; i < arr.length; i++) {
      if (arr[i] < pivot) {
        left.add(arr[i]);
      } else if (arr[i] == pivot) {
        middle.add(arr[i]);
      } else {
        right.add(arr[i]);
      }
    }
    final leftSort = await quickSort(left);
    final rightSort = await quickSort(right);
    final middleSort = await quickSort(middle);
    final sorted = <int>[
      ...(leftSort ?? []),
      ...(middleSort ?? []),
      ...(rightSort ?? []),
    ];

    await Future.delayed(Duration(milliseconds: ref.read(delayProvider)));
    //print(sorted);
    ref.read(algoProvider.notifier).updateList(sorted);

    return sorted;
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBody(
      title: 'Quick Sort',
      onStart: () {
        quickSort(List<int>.from(ref.read(algoProvider)));
      },
    );
  }
}
