import 'package:flutter/material.dart';
import 'package:news/pages/Home/tabbar_listciew.dart';
import '../../core/network_Layer/api_manger.dart';
import '../../models/category_model.dart';
import '../../models/source_model.dart';

class CategoryView extends StatefulWidget {

   CategoryModel categoryModel;
   CategoryView({super.key, required this.categoryModel});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  late Future<SourceModel> fetchSource;

  @override
  void initState() {
    fetchSource = ApiManager.fetchSource(widget.categoryModel.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<SourceModel>(
        future: fetchSource,
          builder: (context, snapshot) {
          if(snapshot.hasError){
           return Column(
             children: [
               const Text("Error fetching"),
               IconButton(onPressed: () {
                 fetchSource;
               },
                   icon: const Icon(Icons.repeat),
               ),
             ],
           );
          }else if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else {
            SourceModel? source = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) => TabBarListView(source!),
              itemCount: source?.sources?.length ?? 0,
            );
          }
        },
      ),
    );
  }
}
