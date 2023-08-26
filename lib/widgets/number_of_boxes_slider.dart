import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visualising_sorting_algos/providers/algo_provider.dart';

class NumberOfBoxesSlider extends ConsumerWidget {
  const NumberOfBoxesSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberOfBoxes = ref.watch(numberOfBoxesProvider);
    return Slider(
      label: 'Number of Boxes',
      value: numberOfBoxes.toDouble(),
      onChanged: (double value) {
        ref.read(numberOfBoxesProvider.notifier).state = value.toInt();
      },
      min: 2,
      max: 500,
      divisions: 498,
    );
  }
}
