import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konga_testapp/constants/colors.dart';

class CategoryNavigation extends StatelessWidget {
  final Function(String) onCategoryTap;

  const CategoryNavigation({Key? key, required this.onCategoryTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': Icons.apps, 'label': 'Browse All'},
      {'icon': Icons.checkroom, 'label': 'Fashion'},
      {'icon': Icons.computer, 'label': 'Computers'},
      {'icon': Icons.phone_android, 'label': 'Phones'},
      {'icon': Icons.local_offer, 'label': 'All Deals'},
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        double itemWidth = constraints.maxWidth / 5;

        return Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: constraints.maxWidth * 0.04),
          child: Row(
            children: categories.map((category) {
              return SizedBox(
                width: itemWidth,
                child: GestureDetector(
                  onTap: () => onCategoryTap(category['label'] as String),
                  child: Column(
                    children: [
                      Container(
                        width: itemWidth * 0.6,
                        height: itemWidth * 0.6,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          category['icon'] as IconData,
                          color: AppColors.textSecondary,
                          size: itemWidth * 0.3,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category['label'] as String,
                        style: GoogleFonts.inter(
                          fontSize: constraints.maxWidth * 0.025,
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
