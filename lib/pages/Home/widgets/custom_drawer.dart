import 'package:flutter/material.dart';
import 'package:news/pages/Settings/settings_view.dart';
import 'Category_Item.dart';

class CustomDrawer extends StatelessWidget {

  final Function onCategoryClicked ;
  CategoryItem? selectedCategory;

   CustomDrawer({
    super.key,
    required this.onCategoryClicked,
    });

  @override
  Widget build(BuildContext context) {


    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);

    return Container(
      width: mediaQuery.size.width * 0.7,
      color: Colors.white,
      child:
       Column(
         children: [
          Container(
            alignment: Alignment.center,
            width: mediaQuery.size.width*0.7,
            height: mediaQuery.size.height*0.123,
            color: theme.primaryColor,
            child: const Text("News App!",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onCategoryClicked();
            },
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: [
                Icon(Icons.menu,
                size: 40 ,
                ),
                  SizedBox(width: 5,),
                  Text("Categories",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight:
                      FontWeight.bold,
                  ),
                 ),
               ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, SettingsView.routeName);
            },
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(Icons.settings,
                    size: 40 ,
                  ),
                  SizedBox(width: 5,),
                  Text("Settings",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

