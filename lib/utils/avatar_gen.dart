mixin AvatarGen {
  static String get _apiKey => "Wo871OTjan2RmC";

  static String get apiUrl => "https://api.multiavatar.com/";

  static String link({required String params}) {
    return "$apiUrl$params??$_apiKey";
  }
}
