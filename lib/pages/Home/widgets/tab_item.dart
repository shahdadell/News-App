import 'package:flutter/material.dart';
import 'package:news/models/source_model.dart';

class TabItem extends StatelessWidget {
  Sources source;
  TabItem( this.source, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        //color: Colors.green,
        borderRadius:BorderRadius.circular(20),
        border: Border.all(
          color: Colors.green,
        )
      ),
      child: Text(
        source.name ?? "",
        style: const TextStyle(
          color: Colors.green
        ),
      ),
    );
  }
}
