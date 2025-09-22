class User {
  String _name;
  String _email;
  String _role;
  String _avatarUrl;
  String _bio;
  bool _isLoggedIn;

  User({
    required String name,
    required String email,
    required String role,
    required String avatarUrl,
    String bio = '',
    bool isLoggedIn = false,
  })  : _name = name,
        _email = email,
        _role = role,
        _avatarUrl = avatarUrl,
        _bio = bio,
        _isLoggedIn = isLoggedIn;

  // Getters
  String get name => _name;
  String get email => _email;
  String get role => _role;
  String get avatarUrl => _avatarUrl;
  String get bio => _bio;
  bool get isLoggedIn => _isLoggedIn;

  // Setters
  set name(String value) => _name = value;
  set email(String value) => _email = value;
  set role(String value) => _role = value;
  set avatarUrl(String value) => _avatarUrl = value;
  set bio(String value) => _bio = value;
  set isLoggedIn(bool value) => _isLoggedIn = value;

  // Polymorphic-style method
  String displayInfo() {
    return '''
👤 $_name ($_role)
📧 $_email
📝 $_bio
''';
  }

  // Utility methods
  bool isAdmin() => _role.toLowerCase() == 'admin';
  bool isGuest() => _role.toLowerCase() == 'guest';
  bool isCreator() => _role.toLowerCase() == 'creator';

  void login() => _isLoggedIn = true;
  void logout() => _isLoggedIn = false;
}
