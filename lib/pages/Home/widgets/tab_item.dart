import 'package:flutter/cupertino.dart';
import 'package:news/models/source_model.dart';

class TabItem extends StatelessWidget {
  Sources source;
  TabItem( this.source, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        source.name ?? "",
      ),
    );
  }
}
