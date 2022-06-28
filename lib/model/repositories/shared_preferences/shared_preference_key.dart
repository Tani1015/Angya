enum SharedPreferencesKey {
  email,
  password
}

extension SharedPreferencesKeyExtension on SharedPreferencesKey {
  String get value => name;
}