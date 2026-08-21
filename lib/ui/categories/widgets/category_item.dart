import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_c19/core/resources/assets_manager.dart';
import 'package:news_c19/core/resources/strings_manager.dart';
import 'package:news_c19/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel category;
  int index;
  void Function(CategoryModel) onCategoryClick;
  CategoryItem(this.category,this.index,this.onCategoryClick);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       onCategoryClick(category);
      },
      child: Directionality(
        textDirection: index.isOdd?TextDirection.rtl:TextDirection.ltr,
        child: Container(
          height: 198.h,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Row(
            children: [
              Expanded(child: Image.asset(category.imagePath,height: 198.h,fit: BoxFit.fill,)),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.title,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(fontSize: 30.sp),
                  ),
                  Container(
                    padding: REdgeInsetsDirectional.only(
                      start: 16,

                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      borderRadius: BorderRadius.circular(84.r)
                    ),
                    child: Row(
                      spacing: 10.w,
                      children: [
                        Text(
                          StringsManager.viewAll,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        CircleAvatar(
                          radius: 27.r,
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          child: SvgPicture.asset(
                            AssetsManager.arrow,
                            matchTextDirection: true,
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
