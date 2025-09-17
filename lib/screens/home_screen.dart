import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konga_testapp/models/product_model.dart';
import 'package:konga_testapp/constants/colors.dart';
import 'package:konga_testapp/widgets/custom_app_bar.dart';
import 'package:konga_testapp/widgets/category_navigation.dart';
import 'package:konga_testapp/widgets/product_carousel.dart';
import 'package:konga_testapp/widgets/service_cards.dart';
import 'package:konga_testapp/widgets/konga_services.dart';
import 'package:konga_testapp/widgets/deals_section.dart';
import 'package:konga_testapp/utils/snackbar_utils.dart';

class ResponsiveHomeScreen extends StatelessWidget {
  const ResponsiveHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        onShopNowPressed: () => SnackbarUtils.showComingSoon(context),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                _buildTopNavBar(context, constraints),
                _buildSearchBar(context, constraints),
                CategoryNavigation(
                  onCategoryTap: (category) =>
                      SnackbarUtils.showComingSoon(context),
                ),
                SizedBox(height: constraints.maxWidth * 0.02),
                ProductCarousel(
                  title: 'The New Samsung Fold And Flip',
                  subtitle: 'Now Available With Luxury Gifts From Samsung',
                  brandTag: 'SAMSUNG',
                  products: _getSamsungProducts(),
                  gradientColors: AppColors.primaryGradient,
                  onProductTap: (product) =>
                      SnackbarUtils.showComingSoon(context),
                ),
                SizedBox(height: constraints.maxWidth * 0.02),
                ServiceCards(
                  onServiceTap: (service) =>
                      SnackbarUtils.showComingSoon(context),
                ),
                SizedBox(height: constraints.maxWidth * 0.02),
                _buildClionBanner(context, constraints),
                SizedBox(height: constraints.maxWidth * 0.02),
                KongaServices(
                  onServiceTap: (service) =>
                      SnackbarUtils.showComingSoon(context),
                ),
                SizedBox(height: constraints.maxWidth * 0.02),
                _buildDealsSection(context, constraints),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildTopNavBar(BuildContext context, BoxConstraints constraints) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: constraints.maxWidth * 0.04,
        vertical: 8,
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.menu, size: 24),
            onPressed: () => SnackbarUtils.showComingSoon(context),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.qr_code_scanner, size: 22),
            onPressed: () => SnackbarUtils.showComingSoon(context),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, size: 24),
            onPressed: () => SnackbarUtils.showComingSoon(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context, BoxConstraints constraints) {
    return Container(
      padding: EdgeInsets.all(constraints.maxWidth * 0.04),
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for products, brands and categories...',
          hintStyle: GoogleFonts.inter(
            color: Colors.grey[400],
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: Icon(Icons.search, color: Colors.grey[400], size: 20),
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        onTap: () => SnackbarUtils.showComingSoon(context),
      ),
    );
  }

  Widget _buildClionBanner(BuildContext context, BoxConstraints constraints) {
    return GestureDetector(
      onTap: () => SnackbarUtils.showComingSoon(context),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.04),
        height: constraints.maxWidth * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: AppColors.clionGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Center(
          child: Text(
            'CLion',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: constraints.maxWidth * 0.08,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      onTap: (index) => SnackbarUtils.showComingSoon(context),
      selectedLabelStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Deals'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
      ],
    );
  }

  List<ProductModel> _getSamsungProducts() {
    return [
      ProductModel(
        id: 'samsung_fold_5',
        name: 'Galaxy Z Fold 5',
        price: '₦2,519,000',
        imageUrl:
            'https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?w=400&h=400&fit=crop',
        isOnSale: true,
        discountPercentage: '15% OFF',
      ),
      ProductModel(
        id: 'samsung_flip_5',
        name: 'Galaxy Z Flip 5',
        price: '₦2,750,000',
        imageUrl:
            'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400&h=400&fit=crop',
        isOnSale: true,
        discountPercentage: '10% OFF',
      ),
      ProductModel(
        id: 'samsung_s24_ultra',
        name: 'Galaxy S24 Ultra',
        price: '₦2,487,000',
        imageUrl:
            'https://images.unsplash.com/photo-1574944985070-8f3ebc6b79d2?w=400&h=400&fit=crop',
        isOnSale: false,
      ),
      ProductModel(
        id: 'samsung_s24',
        name: 'Galaxy S24',
        price: '₦1,819,000',
        imageUrl:
            'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=400&h=400&fit=crop',
        isOnSale: true,
        discountPercentage: '12% OFF',
      ),
      ProductModel(
        id: 'samsung_a54',
        name: 'Galaxy A54 5G',
        price: '₦3,850,000',
        imageUrl:
            'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?w=400&h=400&fit=crop',
        isOnSale: false,
      ),
    ];
  }
}

Widget _buildDealsSection(BuildContext context, BoxConstraints constraints) {
  final dealsData = [
    {
      'discount': '-16%',
      'imageUrl':
          'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      'name': 'Power Generator',
      'price': '₦185,000',
    },
    {
      'discount': '-29%',
      'imageUrl':
          'https://images.unsplash.com/photo-1626806787461-102c1bfaaea1?w=400&h=400&fit=crop',
      'name': 'Washing Machine',
      'price': '₦125,000',
    },
  ];

  double cardWidth = constraints.maxWidth * 0.44;

  return Container(
    color: AppColors.dealsPurple,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(constraints.maxWidth * 0.04),
          child: Row(
            children: [
              Text(
                "Today's Deals",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: constraints.maxWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => _showComingSoon(context),
                child: Text(
                  'See All Items',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: constraints.maxWidth * 0.03,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: constraints.maxWidth * 0.55,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth * 0.04,
            ),
            itemCount: dealsData.length,
            itemBuilder: (context, index) {
              final deal = dealsData[index];
              return GestureDetector(
                onTap: () => _showComingSoon(context),
                child: Container(
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
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(8),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: CachedNetworkImage(
                                  imageUrl: deal['imageUrl']!,
                                  width: cardWidth * 0.8,
                                  height: cardWidth * 0.6,
                                  fit: BoxFit.contain,
                                  placeholder: (context, url) => Container(
                                    width: cardWidth * 0.6,
                                    height: cardWidth * 0.6,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(
                                      index == 0
                                          ? Icons.electrical_services
                                          : Icons.local_laundry_service,
                                      size: cardWidth * 0.3,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                        width: cardWidth * 0.6,
                                        height: cardWidth * 0.6,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              index == 0
                                                  ? Icons.electrical_services
                                                  : Icons.local_laundry_service,
                                              size: cardWidth * 0.25,
                                              color: AppColors.textSecondary,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              deal['name']!,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.inter(
                                                fontSize:
                                                    constraints.maxWidth *
                                                    0.022,
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.discountRed,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    deal['discount']!,
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: constraints.maxWidth * 0.025,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                deal['name']!,
                                style: GoogleFonts.inter(
                                  fontSize: constraints.maxWidth * 0.028,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                deal['price']!,
                                style: GoogleFonts.inter(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: constraints.maxWidth * 0.032,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: constraints.maxWidth * 0.04),
      ],
    ),
  );
}

void _showComingSoon(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Coming Soon!',
        style: GoogleFonts.inter(fontWeight: FontWeight.w500),
      ),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
