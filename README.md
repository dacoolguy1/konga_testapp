# Konga Test App

A Flutter application replicating the Konga e-commerce interface with responsive design and modern UI components.

## Overview

This app demonstrates a complete e-commerce home screen implementation featuring product carousels, service cards, category navigation, and responsive design patterns. The application uses a clean architecture approach with reusable widgets and consistent styling.

## Features

### Core Functionality
- **Splash Screen**: Animated startup screen with Konga branding
- **Home Screen**: Complete e-commerce interface with multiple sections
- **Product Display**: Interactive product carousels with Samsung devices
- **Service Integration**: Konga services showcase (Travel, KongaPay, etc.)
- **Category Navigation**: Browse categories with intuitive icons
- **Responsive Design**: Adapts to different screen sizes

### UI Components
- **Custom App Bar**: Branded header with action buttons
- **Product Carousel**: Horizontal scrolling product display
- **Service Cards**: Action-oriented service tiles
- **Category Grid**: Easy navigation between product categories
- **Deals Section**: Featured promotions and discounts
- **Bottom Navigation**: Standard e-commerce navigation

## Project Structure

```
lib/
├── constants/
│   ├── colors.dart           # App color scheme and gradients
│   └── strings.dart          # Text constants and labels
├── models/
│   └── product_model.dart    # Product data structure
├── screens/
│   ├── splash_screen.dart    # Animated splash screen
│   └── home_screen.dart      # Main home interface
├── widgets/
│   ├── custom_app_bar.dart   # Reusable app bar component
│   ├── category_navigation.dart # Category browsing widget
│   ├── product_carousel.dart # Product display carousel
│   ├── service_cards.dart    # Service action cards
│   └── konga_services.dart   # Konga-specific services
└── utils/
    └── snackbar_utils.dart   # UI feedback utilities
```

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cached_network_image: ^3.2.3  # Image caching and loading
  google_fonts: ^4.0.4          # Typography (Inter font)
```

## Design System

### Colors
- **Primary**: Pink (`#E91E63`) with purple accent (`#4A148C`)
- **Secondary**: Orange (`#FF9800`) for highlights
- **Gradients**: Purple-to-pink for headers and CTAs
- **Neutrals**: Light grays for backgrounds and cards

### Typography
- **Font Family**: Inter (via Google Fonts)
- **Weights**: Regular (400), Medium (500), Semi-bold (600), Bold (700)
- **Responsive sizing**: Based on screen width percentages

### Layout
- **Responsive Design**: Uses `LayoutBuilder` for adaptive sizing
- **Spacing**: Percentage-based padding and margins
- **Cards**: Consistent 8px border radius with subtle shadows

## Key Components

### ProductModel
Data structure for product information:
- Basic details (id, name, price)
- Optional metadata (rating, reviews, category)
- Sale indicators and discount percentages
- Image URL support with fallbacks

### ProductCarousel
Horizontal scrolling widget featuring:
- Branded header with gradient background
- Product cards with images and pricing
- Discount badges for sale items
- Placeholder handling for missing images

### Service Integration
Multiple service display patterns:
- **Service Cards**: Large action tiles for primary services
- **Konga Services**: Grid layout with emoji icons
- **Category Navigation**: Horizontal icon-based browsing

## Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (2.17.0 or higher)
- IDE with Flutter support (VS Code, Android Studio)

### Installation

1. **Clone the repository**
```bash
git clone [repository-url]
cd konga_testapp
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the application**
```bash
flutter run
```

### Development Setup

1. **Enable responsive preview**
   - Use device simulators or Flutter Inspector
   - Test on multiple screen sizes

2. **Hot reload during development**
   - Press `r` in terminal for hot reload
   - Press `R` for hot restart

## Architecture Notes

### State Management
- Currently uses basic stateless widgets
- Ready for integration with Provider, Bloc, or Riverpod
- Product data prepared for API integration

### Image Handling
- `cached_network_image` for efficient loading
- Fallback placeholders for missing images
- Proper error handling for network issues

### Responsive Approach
- Percentage-based sizing throughout
- `LayoutBuilder` for adaptive layouts
- Consistent spacing ratios across devices

## Customization

### Branding
Update `lib/constants/colors.dart` for different color schemes:
```dart
static const Color primary = Color(0xFFYOUR_COLOR);
```

### Content
Modify `lib/constants/strings.dart` for different text content:
```dart
static const String appName = 'Your App Name';
```

### Products
Add sample products in `ProductData.getSampleProducts()`:
```dart
ProductModel(
  id: 'new_product',
  name: 'Product Name',
  price: '₦100,000',
  // ... other properties
)
```

## Future Enhancements

### Planned Features
- [ ] Product detail screens
- [ ] Shopping cart functionality
- [ ] User authentication
- [ ] Search implementation
- [ ] Category filtering
- [ ] API integration
- [ ] Payment processing
- [ ] Order tracking

### Technical Improvements
- [ ] State management implementation
- [ ] Offline support
- [ ] Performance optimization
- [ ] Accessibility enhancements
- [ ] Unit and widget tests
- [ ] CI/CD pipeline

## Performance Considerations

- **Image Loading**: Cached network images reduce data usage
- **Lazy Loading**: ListView builders for efficient scrolling
- **Memory Management**: Proper disposal of animation controllers
- **Build Optimization**: Const constructors where possible

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Style
- Follow Dart/Flutter conventions
- Use meaningful variable names
- Add comments for complex logic
- Maintain consistent formatting

## License

This project is created for demonstration purposes. Check with Konga regarding trademark and brand usage.

## Support

For questions or issues:
1. Check existing documentation
2. Search through project issues
3. Create a detailed issue report
4. Include screenshots for UI problems

---

**Note**: This is a UI demonstration app. Product images and some features show placeholder content with "Coming Soon" notifications.