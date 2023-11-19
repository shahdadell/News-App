import 'package:flutter/material.dart';
import 'package:news/core/network_Layer/api_manger.dart';
import 'package:news/models/category_model.dart';

class NewsDetailsView extends StatelessWidget {

  final CategoryModel categoryModel;
  const NewsDetailsView({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.fetchSources(categoryModel.categoryId),
        builder: (context,snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString(),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          }
          return Container();
        }
    );
  }
}
