import 'package:flutter/material.dart';
import 'package:news/models/source_model.dart';
import 'package:news/pages/Home/widgets/tab_item.dart';

class TabBarListView extends StatelessWidget {
  SourceModel sourceModel;
  int selectedIndex = 0;
   TabBarListView(this.sourceModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: selectedIndex,
      length: sourceModel.sources!.length ?? 0,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              labelPadding: EdgeInsets.all(12),
              onTap: (index) {
                selectedIndex = index;
              },

              tabs: sourceModel.sources?.map((element)
              {
                return TabItem(element);
              }
              ).toList() ?? [],
            ),
          ],
        ),
    );
  }
}
