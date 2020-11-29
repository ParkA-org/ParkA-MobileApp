class User {
  String id;
  String name;
  String lastName;
  String email;
  String profilePicture;
  String informationId;

  User({
    this.id,
    this.name,
    this.lastName,
    this.email,
    this.profilePicture,
    this.informationId,
  });

  static userFromJson(Map<String, dynamic> userData) {
    if (userData == null) return new User();

    return new User(
      id: userData["id"],
      email: userData["email"],
      lastName: userData["lastName"],
      name: userData["name"],
      profilePicture: userData["profilePicture"],
    );
  }
}
