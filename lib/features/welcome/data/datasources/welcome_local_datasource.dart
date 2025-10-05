import 'package:shoppe_app/features/welcome/data/models/onboarding_item_model.dart';

abstract class WelcomeLocalDataSource {
  Future<List<OnboardingItemModel>> getOnboardingItems();
  Future<bool> completeOnboarding();
  Future<bool> isOnboardingCompleted();
}

class WelcomeLocalDataSourceImpl implements WelcomeLocalDataSource {
  // In a real app, you would use SharedPreferences or Hive here

  @override
  Future<List<OnboardingItemModel>> getOnboardingItems() async {
    // Mock data for now
    return [
      const OnboardingItemModel(
        title: 'Browse Products',
        description: 'Discover thousands of products from top brands',
        image: 'assets/images/onboarding1.png',
      ),
      const OnboardingItemModel(
        title: 'Easy Shopping',
        description: 'Add items to cart and checkout with ease',
        image: 'assets/images/onboarding2.png',
      ),
      const OnboardingItemModel(
        title: 'Fast Delivery',
        description: 'Get your orders delivered to your doorstep',
        image: 'assets/images/onboarding3.png',
      ),
    ];
  }

  @override
  Future<bool> completeOnboarding() async {
    // Save to SharedPreferences
    // await prefs.setBool('onboarding_completed', true);
    return true;
  }

  @override
  Future<bool> isOnboardingCompleted() async {
    // Read from SharedPreferences
    // return prefs.getBool('onboarding_completed') ?? false;
    return false;
  }
}
