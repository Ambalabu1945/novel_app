class UserSession {
  static String? _loggedInEmail;

  // Get current session email
  static String? get currentUserEmail => _loggedInEmail;

  // Check if user is logged in
  static bool get isLoggedIn => _loggedInEmail != null;

  // Login method
  static void login(String email) {
    _loggedInEmail = email;
  }

  // Logout method
  static void logout() {
    _loggedInEmail = null;
  }

  // Display session info
  static String sessionInfo() {
    return isLoggedIn
        ? '🟢 Logged in as $_loggedInEmail'
        : '🔴 No user logged in';
  }
}
