import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konga_testapp/models/product_model.dart';
import 'package:konga_testapp/constants/colors.dart';

class ProductCarousel extends StatelessWidget {
  final String title;
  final String subtitle;
  final String brandTag;
  final List<ProductModel> products;
  final List<Color> gradientColors;
  final Function(ProductModel) onProductTap;

  const ProductCarousel({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.brandTag,
    required this.products,
    required this.gradientColors,
    required this.onProductTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double carouselHeight = constraints.maxWidth * 0.8;
        double cardWidth = constraints.maxWidth * 0.28;

        return Container(
          margin: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.04),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(constraints.maxWidth * 0.04),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: constraints.maxWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            subtitle,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: constraints.maxWidth * 0.03,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        brandTag,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: carouselHeight * 0.6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.04,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () => onProductTap(product),
                      child: _buildProductCard(
                        product,
                        index,
                        cardWidth,
                        constraints,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: constraints.maxWidth * 0.04),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProductCard(
    ProductModel product,
    int index,
    double cardWidth,
    BoxConstraints constraints,
  ) {
    return Container(
      width: cardWidth,
      margin: EdgeInsets.only(right: constraints.maxWidth * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors
                    .productColors[index % AppColors.productColors.length]
                    .withOpacity(0.05),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: CachedNetworkImage(
                      imageUrl: product.imageUrl ?? '',
                      width: cardWidth * 0.8,
                      height: cardWidth * 0.8,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => _buildPlaceholder(
                        cardWidth,
                        index,
                        constraints,
                        'Samsung\nPhone',
                        Icons.phone_android,
                      ),
                      errorWidget: (context, url, error) => _buildPlaceholder(
                        cardWidth,
                        index,
                        constraints,
                        'Samsung\nPhone',
                        Icons.phone_android,
                      ),
                    ),
                  ),
                  if (product.isOnSale && product.discountPercentage != null)
                    Positioned(
                      top: 4,
                      right: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.discountRed,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          product.discountPercentage!,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: constraints.maxWidth * 0.022,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  product.name ?? 'Samsung Phone',
                  style: GoogleFonts.inter(
                    fontSize: constraints.maxWidth * 0.024,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  product.price,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                    fontSize: constraints.maxWidth * 0.028,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(
    double cardWidth,
    int index,
    BoxConstraints constraints,
    String text,
    IconData icon,
  ) {
    return Container(
      width: cardWidth * 0.6,
      height: cardWidth * 0.6,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: cardWidth * 0.25,
            color:
                AppColors.productColors[index % AppColors.productColors.length],
          ),
          const SizedBox(height: 4),
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: constraints.maxWidth * 0.02,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
