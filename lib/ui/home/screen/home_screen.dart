import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_c19/core/remote/network/api_manager.dart';
import 'package:news_c19/core/resources/assets_manager.dart';
import 'package:news_c19/core/resources/routes_manager.dart';
import 'package:news_c19/core/resources/strings_manager.dart';
import 'package:news_c19/model/category_model.dart';
import 'package:news_c19/ui/articles/articles_widget.dart';
import 'package:news_c19/ui/categories/categories_widget.dart';
import 'package:news_c19/ui/home/widgets/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;
  @override
  Widget build(BuildContext context) {
    Person(gender: "M",age: 30,name: "Ahmed",friends: ["Said","Mohamed","Sara"]);
    return Scaffold(
      drawer: HomeDrawer(unSelectCategory),
      appBar: AppBar(
        title: Text(selectedCategory!=null?selectedCategory!.title:StringsManager.home),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).pushNamed(RoutesManager.searchRouteName);
          }, icon: SvgPicture.asset(AssetsManager.search))
        ],
      ),
      body: selectedCategory!=null?ArticlesWidget(category: selectedCategory!,):CategoriesWidget(selectCategory),
    );
  }

  void selectCategory(CategoryModel newCategory){
    setState(() {
      selectedCategory = newCategory;
    });
  }

  void unSelectCategory(){
    Navigator.of(context).pop();
    setState(() {
      selectedCategory = null;
    });
  }
}

class Person{
  String name;
  int age;
  String gender;
  List<String> friends;
  Person({required this.name,required this.friends,required this.gender,required this.age});
}


