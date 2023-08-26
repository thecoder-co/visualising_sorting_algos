import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visualising_sorting_algos/providers/algo_provider.dart';
import 'package:visualising_sorting_algos/widgets/custom_drawer.dart';
import 'package:visualising_sorting_algos/widgets/delay_slider.dart';
import 'package:visualising_sorting_algos/widgets/number_of_boxes_slider.dart';
import 'package:visualising_sorting_algos/widgets/sorter.dart';

class ScaffoldBody extends ConsumerWidget {
  final String title;

  final Function onStart;
  const ScaffoldBody({
    super.key,
    required this.title,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const CustomDrawer(),
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/background.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? MediaQuery.of(context).size.width * 0.01 * 10
                          : MediaQuery.of(context).size.width * 0.01 * 12.5,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            ref.read(playProvider.notifier).state = false;
                          },
                          icon: const Icon(
                            Icons.stop,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            ref.read(playProvider.notifier).state = true;
                            onStart();
                          },
                          icon: const Icon(
                            Icons.play_arrow_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            final list = ref.read(algoProvider);

                            final newList = [...list];
                            newList.shuffle();
                            ref.read(algoProvider.notifier).updateList(newList);
                          },
                          icon: const Icon(
                            Icons.shuffle,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      child: Column(
                        children: [
                          Text(
                            'Elements',
                            style: Theme.of(context).textTheme.titleLarge,
                            maxLines: 1,
                          ),
                          const NumberOfBoxesSlider(),
                          Text(
                            'Delay',
                            style: Theme.of(context).textTheme.titleLarge,
                            maxLines: 1,
                          ),
                          const DelaySlider(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Sorter(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
