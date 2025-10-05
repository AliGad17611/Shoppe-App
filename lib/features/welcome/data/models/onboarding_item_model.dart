import 'package:shoppe_app/features/welcome/domain/entities/onboarding_item.dart';

class OnboardingItemModel extends OnboardingItem {
  const OnboardingItemModel({
    required super.title,
    required super.description,
    required super.image,
  });

  factory OnboardingItemModel.fromJson(Map<String, dynamic> json) {
    return OnboardingItemModel(
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'description': description, 'image': image};
  }
}
