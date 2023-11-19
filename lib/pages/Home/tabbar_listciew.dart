import 'package:flutter/material.dart';
import 'package:news/models/source_model.dart';
import 'package:news/pages/Home/widgets/tab_item.dart';

class TabBarListView extends StatefulWidget {
  SourceModel sourceModel;

   TabBarListView(this.sourceModel, {super.key});

  @override
  State<TabBarListView> createState() => _TabBarListViewState();
}

class _TabBarListViewState extends State<TabBarListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          initialIndex: selectedIndex,
          length: widget.sourceModel.sources!.length ?? 0,
            child: Column(
              children: [
                TabBar(
                  indicator: const BoxDecoration(),
                  isScrollable: true,
                  labelPadding: const EdgeInsets.all(12),
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });

                  },

                  tabs: widget.sourceModel.sources?.map((element)
                  {
                    return TabItem(
                        element,
                        selectedIndex == widget.sourceModel.sources?.indexOf(element));
                  }
                  ).toList() ?? [],
                ),
              ],
            ),
        ),
      ],
    );
  }
}
