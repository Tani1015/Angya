enum SharedPreferencesKey {
  email,
  password,
  lat,
  lng
}

extension SharedPreferencesKeyExtension on SharedPreferencesKey {
  String get value => name;
}