import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visualising_sorting_algos/color/colors_gen.dart';
import 'package:visualising_sorting_algos/providers/algo_provider.dart';
import 'package:visualising_sorting_algos/widgets/box.dart';

class Sorter extends ConsumerStatefulWidget {
  const Sorter({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SorterState();
}

class _SorterState extends ConsumerState<Sorter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = (MediaQuery.sizeOf(context).height - 320);
    final width = MediaQuery.sizeOf(context).width - 40;
    final indexList = ref.watch(algoProvider);
    final numberOfBoxes = ref.watch(numberOfBoxesProvider);
    final colors = ColorGen(numberOfBoxes);
    final colorList = colors.generateGradientColors(
      startColor: Colors.amber[100]!,
      endColor: Colors.amber[900]!,
    );

    return SizedBox(
      height: height,
      width: width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
          numberOfBoxes,
          (index) {
            final element = indexList.elementAtOrNull(index);
            if (element == null) {
              return const SizedBox();
            }
            return SortBox(
              fullWidth: width,
              fullHeight: height,
              startIndex: element,
              color: colorList[element],
            );
          },
        ),
      ),
    );
  }
}
