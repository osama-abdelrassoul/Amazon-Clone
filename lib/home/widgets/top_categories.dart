import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/home/screens/category_deals_screen.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({Key? key}) : super(key: key);
  void navigateToCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryDealsScreen.routeName,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = GlobalVariables().getScreenSize();
    return SizedBox(
      height: screenSize.height * 0.1,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: GlobalVariables.categoryImages.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                navigateToCategoryPage(
                    context, GlobalVariables.categoryImages[index]['title']!);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: screenSize.height * 0.09,
                    height: screenSize.height * 0.073,
                    padding: const EdgeInsets.only(left: 10),
                    child: Flexible(
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(screenSize.height * 0.055),
                        child: Image.asset(
                          GlobalVariables.categoryImages[index]['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    GlobalVariables.categoryImages[index]['title']!,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            );
          })),
    );
  }
}
