class GoogleContact {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  GoogleContact({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
  });

  static GoogleContact contactFromJson(Map<String, dynamic> json) {
    return GoogleContact(
        firstName: json["names"][0]["givenName"] ?? null,
        lastName: json["names"][0]["familyName"] ?? null,
        email: json["emailAddresses"] ?? null,
        phoneNumber: json["phoneNumbers"] ?? null);
  }
}
