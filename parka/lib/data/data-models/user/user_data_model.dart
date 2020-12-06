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

  static User userFromJson(Map<String, dynamic> user) {
    return User(
      id: user["id"],
      email: user["email"],
      lastName: user["lastName"],
      profilePicture: user["profilePicture"],
      informationId: user["userInformation"],
    );
  }
}
