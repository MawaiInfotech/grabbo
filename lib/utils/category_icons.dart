class CategoryIcons {
  CategoryIcons._(); // prevent instantiation

  static const Map<String, String> localIcons = {
    "All": "assets/images/dashboard.png",
    "Grocery": "assets/images/grocery1.png",
    "Health Care": "assets/images/pharmacy.png",
    "Electronics": "assets/images/headphones.png",
    "Fresh": "assets/images/fresh.png",
    "Fashion": "assets/images/fashion.png",
    "New": "assets/images/new.png",
    "Smart Gadget": "assets/images/gadget.png",
    "Home": "assets/images/home.png",
    "Toys": "assets/images/toys.png",
    "Beauty & Personal Care": "assets/images/beauty.png",
    "Sports Hub": "assets/images/sports.png",
    "Furniture": "assets/images/Furniture.png",
    "Appliances": "assets/images/Appliances.png",
  };

  /// fallback icon
  static const String fallback =
      "assets/images/dashboard.png";

  static String getIcon(String categoryName) {
    return localIcons[categoryName] ?? fallback;
  }
}