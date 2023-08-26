import 'package:flutter/material.dart';
import 'package:visualising_sorting_algos/providers/algo_provider.dart';
import 'package:visualising_sorting_algos/widgets/scaffold_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BubbleSort extends ConsumerStatefulWidget {
  const BubbleSort({super.key});

  @override
  ConsumerState<BubbleSort> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<BubbleSort> {
  Future<List<int>> quickSort(List<int> arr) async {
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

    final sorted = [...await quickSort(left), pivot, ...await quickSort(right)];

    await Future.delayed(Duration(milliseconds: ref.read(delayProvider)));
    //print(sorted);
    ref.read(algoProvider.notifier).updateList(sorted);

    return sorted;
  }

  (List<int>, int, int, int)? bubbleSortStep(
      List<int> arr, int n, int i, int j) {
    if (i >= n - 1) {
      return null; // Base case: sorting is complete
    }

    if (j < n - i - 1) {
      if (arr[j] > arr[j + 1]) {
        // Swap arr[j] and arr[j+1]
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }

      return (arr, n, i, j + 1); // Move to the next element
    }

    return (arr, n, i + 1, 0); // Move to the next pass
  }

  void bubbleSortRecursive(int step, subStep) async {
    if (!ref.read(playProvider)) {
      return;
    }
    final list = ref.read(algoProvider);
    final arr = <int>[...list];

    final newStep = bubbleSortStep(arr, arr.length, step, subStep);
    if (newStep != null) {
      ref.read(algoProvider.notifier).updateList(newStep.$1);
      await Future.delayed(
        Duration(milliseconds: ref.read(delayProvider)),
      );
      bubbleSortRecursive(newStep.$3,
          newStep.$4); // Use item3 to access the third element of the tuple
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBody(
      title: 'Bubble Sort',
      onStart: () {
        bubbleSortRecursive(0, 0);
      },
    );
  }
}
