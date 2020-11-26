Map<String, String> iconNames = {
  "camara": "camFeature.svg",
  "Seguridad": "accessControlFeature.svg",
  "Vigilancia 24/7": "guardFeature.svg",
  "Car wash": "carWashFeature.svg",
  "Electrico": "carChargeFeature.svg",
  "valet": "valetParkingFeature.svg",
};

String getFeatureIcon(String slug) {
  String baseString = "resources/images/features/";

  return "$baseString${iconNames[slug.trim()]}";
}
