class Routes {
  static const String splash = 'splash';
  static const String home = 'home';
  static const String reservation = 'reservation';
  static const String courtSelection = 'courtSelection';
}

class Assets {
  static const String logo = "lib/resources/images/logo.png";
  static const String splashImage = "lib/resources/images/splash_image.jpg";
  static const String courtRecreative = "lib/resources/images/receativa.jpg";
  static const String courtProfessional =
      "lib/resources/images/profesional.jpg";
  static const String courtTraining = "lib/resources/images/entrenamiento.jpg";
}

class DataBase {
  static const String createTablehour =
      "CREATE TABLE hour(id INTEGER PRIMARY KEY, details TEXT)";
  static const String createTableCourt =
      "CREATE TABLE court(id INTEGER PRIMARY KEY, name TEXT,size TEXT,details TEXT,image TEXT)";

 static const  String createTableBooking =
      "CREATE TABLE booking(id INTEGER PRIMARY KEY, date TEXT,idCourt INTEGER,weather TEXT,precipitation INTEGER,grade INTEGER)";
}

class Const {
  static const double buttonRadius = 15;
  static const double margin = 18;
  static const double radius = 12;
  static const double space5 = 5;
  static const double space8 = 8;
  static const double space12 = 12;
  static const double space15 = 15;
  static const double space25 = 25;
  static const int splashDuration = 3;
  static const double textFieldRadius = 15;
}
