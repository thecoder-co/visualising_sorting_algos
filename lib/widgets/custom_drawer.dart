import 'package:flutter/material.dart';
import 'package:visualising_sorting_algos/bubblesort.dart';
import 'package:visualising_sorting_algos/quicksort.dart';
import 'package:visualising_sorting_algos/utils/app_routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text(
              'Visualising Sorting Algorithms',
              style: TextStyle(
                fontSize: 20,
                //color: Colors.white,
              ),
            ),
          ),
          ListTile(
            title: const Text('Bubble Sort'),
            onTap: () {
              pushToAndClearStack(context, const BubbleSort());
            },
          ),
          ListTile(
            title: const Text('Quick Sort'),
            onTap: () {
              pushToAndClearStack(context, const QuickSort());
            },
          ),
        ],
      ),
    );
  }
}
