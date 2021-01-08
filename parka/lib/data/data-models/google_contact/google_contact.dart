class GoogleContact {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String profilePictureUrl;

  GoogleContact({
    this.profilePictureUrl,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
  });

  static GoogleContact contactFromJson(Map<String, dynamic> json) {
    return GoogleContact(
        firstName: json["names"][0]["givenName"] ?? null,
        lastName: json["names"][0]["familyName"] ?? null,
        email: json["emailAddresses"][0]["value"] ?? null,
        profilePictureUrl: json["photos"][0]["url"],
        phoneNumber: json["phoneNumbers"] != null
            ? json["phoneNumbers"][0]["value"]
            : null);
  }
}
