class UserProfileEntity {
  final String uid;
  final String name;
  final String email;
  final String? photoUrl;
  final String? phone;

  const UserProfileEntity({
    required this.uid,
    required this.name,
    required this.email,
    this.photoUrl,
    this.phone,
  });
}
