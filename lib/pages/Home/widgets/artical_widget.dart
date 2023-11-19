import 'package:flutter/material.dart';
import '../../../core/network_Layer/api_manger.dart';
import '../../../models/artical_model.dart';
import '../../../models/source_model.dart';
import 'artical_item.dart';

class NewsArticalsList extends StatelessWidget {

  Sources source;

  NewsArticalsList({
    super.key,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticalsModel>(
      future: ApiManager.fetchArticals(source.id!),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Articles> articalsList = snapshot.data?.articles ?? [];
        return ListView.builder(
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) =>
              NewsArticalItem(articles: articalsList[index]),
          itemCount: articalsList.length,
        );
      },
    );
  }
}