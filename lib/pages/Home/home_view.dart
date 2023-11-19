import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/pages/Home/widgets/Category_Item.dart';
import 'package:news/pages/Home/widgets/custom_drawer.dart';
import 'package:news/pages/Home/widgets/news_details.dart';

class HomeView extends StatefulWidget {

  static const String routeName="Home";

   HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryModel> categories =[
    CategoryModel(
        categoryId: "Sports",
        categoryTitle: "Sports",
        categoryImage: "assets/images/sports.png",
        categoryColor: const Color(0xFFC91C22),
    ),
    CategoryModel(
      categoryId: "Politics",
      categoryTitle: "Politics",
      categoryImage: "assets/images/Politics.png",
      categoryColor: const Color(0xFF003E90),
      ),
    CategoryModel(
      categoryId: "Health",
      categoryTitle: "Health",
      categoryImage: "assets/images/health.png",
      categoryColor: const Color(0xFFED1E79),
    ),
    CategoryModel(
      categoryId: "Business",
      categoryTitle: "Business",
      categoryImage: "assets/images/bussines.png",
      categoryColor: const Color(0xFFCF7E48),
    ),
    CategoryModel(
      categoryId: "Environment",
      categoryTitle: "Environment",
      categoryImage: "assets/images/environment.png",
      categoryColor: const Color(0xFF4882CF),
    ),
    CategoryModel(
      categoryId: "Science",
      categoryTitle: "Science",
      categoryImage: "assets/images/science.png",
      categoryColor: const Color(0xFFF2D352),
    ),

  ];

  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
              selectedCategory == null ?
              "News App" : selectedCategory!.categoryTitle,
          ),
        ),
        drawer: CustomDrawer(
          onCategoryClicked: onDrawerCategoryClicked,
          onPressed: onDrawerCategoryClicked,
        ),
        body: selectedCategory == null ?
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Pick Your Category \n of interest",
              textAlign: TextAlign.start,
              style: theme.textTheme.titleLarge?.copyWith(
                color: Color(0xFF4F5A69),
              ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(20),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 9/11,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) => CategoryItem(
                      categoryModel: categories[index],
                      index: index,
                      onItemClick: onCategoryItemClick,
                    ),
                    itemCount: categories.length,
                ),
              ),
            ],
          ),
        ) :
        NewsDetailsView(categoryModel: selectedCategory!),
        ),
    );
  }

  CategoryModel? selectedCategory;

  onCategoryItemClick(CategoryModel categoryModel){
    print((categoryModel.categoryId),
    );
    selectedCategory = categoryModel;
    setState(() {
    });
  }
  onDrawerCategoryClicked(){
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {
    });
  }
}
