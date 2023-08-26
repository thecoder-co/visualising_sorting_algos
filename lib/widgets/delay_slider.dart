import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visualising_sorting_algos/providers/algo_provider.dart';

class DelaySlider extends ConsumerWidget {
  const DelaySlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final delay = ref.watch(delayProvider);
    return Slider(
      label: 'Delay',
      value: delay.toDouble(),
      onChanged: (double value) {
        ref.read(delayProvider.notifier).state = value.toInt();
      },
      min: 1,
      max: 50,
      divisions: 50,
    );
  }
}
