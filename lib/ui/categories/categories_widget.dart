import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c19/core/resources/strings_manager.dart';
import 'package:news_c19/model/category_model.dart';
import 'package:news_c19/ui/categories/widgets/category_item.dart';

class CategoriesWidget extends StatelessWidget {
  void Function(CategoryModel) onCategoryClick;
  CategoriesWidget(this.onCategoryClick);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          Text(StringsManager.welcome,style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w500
          ),),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => CategoryItem(CategoryModel.categories[index],index,onCategoryClick),
                  separatorBuilder: (context, index) => SizedBox(height: 16.h,),
                  itemCount:CategoryModel.categories.length
              )
          )
        ],
      ),
    );
  }
}
