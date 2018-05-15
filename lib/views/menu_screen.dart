import 'package:flutter/material.dart';
import 'package:match_day_chat/colors.dart';
import 'package:meta/meta.dart';

enum Category { a, b, c, d, e, f, g, h}

class MenuScreen extends StatelessWidget {
  final Category currentCategory;
  final ValueChanged<Category> onCategoryTap;
  final List<Category> _categories = Category.values;

  const MenuScreen({
    Key key,
    @required this.currentCategory,
    this.onCategoryTap,
  }) : assert(currentCategory != null);

  @override
  Widget build(BuildContext context) {
    var menuItems = <Widget>[];
    _categories.forEach((Category c){
      menuItems.add(_buildCategory(c, context));
    });

    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 40.0),
        color: kMatchDayErrorRed,
        child: ListView(children: menuItems),
      ),
    );
  }

  //TODO: adjust theming
  Widget _buildCategory(Category category, BuildContext context){
    var categoryString =
    category.toString().replaceAll('Category.', '').toUpperCase();
    return GestureDetector(
      onTap: () => onCategoryTap(category),
      child: category == currentCategory
        ? Column(
        children: <Widget>[
          SizedBox(height: 16.0),
          Text(
            categoryString,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 14.0),
          Container(
            width: 70.0,
            height: 2.0,
            color: kMatchDayErrorRed,
          ),
        ],
      ) :
         Container(
           padding: EdgeInsets.symmetric(vertical: 16.0),
           child: Text(
             categoryString,
             textAlign: TextAlign.center,
           ),
         )
    );
  }
}
