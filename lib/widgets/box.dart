import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visualising_sorting_algos/providers/algo_provider.dart';

class SortBox extends ConsumerWidget {
  final double fullWidth;
  final double fullHeight;
  final int startIndex;
  final Color color;
  const SortBox({
    super.key,
    required this.fullWidth,
    required this.fullHeight,
    required this.startIndex,
    required this.color,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberOfBoxes = ref.watch(numberOfBoxesProvider);
    return Container(
      width: fullWidth / numberOfBoxes,
      // height is percentage of the numberOfBoxes is the startIndex from 10% to 100%
      height: calculateHeight(startIndex, numberOfBoxes,
          minHeight: 0.05 * fullHeight, maxHeight: fullHeight),
      decoration: BoxDecoration(
        color: color,
        // border: Border.all(
        //   color: Colors.black,
        //   // width is inversely proportional to the number of boxes and directly proportional to the width of the screen
        //   width: 3,
        // ),
      ),
    );
  }
}

double calculateHeight(int index, int numSteps,
    {double minHeight = 0.1, double maxHeight = 1.0}) {
  return minHeight + (index / (numSteps - 1)) * (maxHeight - minHeight);
}
