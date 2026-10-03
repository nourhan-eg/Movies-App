class AppAvatars {
  static const String pinkHair = 'assets/avatars/avatar_pink_hair.png';
  static const String beardMan = 'assets/avatars/avatar_beard_man.png';
  static const String braidsGirl = 'assets/avatars/avatar_braids_girl.png';
  static const String blondeMan = 'assets/avatars/avatar_blonde_man.png';

  static const List<String> all = [
    beardMan,
    blondeMan,
    braidsGirl,
    pinkHair,
  ];

  static String resolve(String? path) {
    return (path != null && path.isNotEmpty) ? path : beardMan;
  }
}
