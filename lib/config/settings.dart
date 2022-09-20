import '../models/user_models.dart';

class Settings {
  static String apiUrl = "http://app.iamspe.sp.gov.br/api/portal-app/";
  //static String apiUrl = "http://10.146.88.2:8094/gsi/";
  static String apiUrlGuardian = "http://app.iamspe.sp.gov.br/api/guardian/";
  static String apiUrlMv = "http://app.iamspe.sp.gov.br/api/smv/";
  //static String apiUrl_Mv = "http://10.146.88.2:8095/mv/";
  //static String apiUrl_Guardian = "http://10.146.88.5:8099/guardian/";
  static String apiUrlTele = "http://app.iamspe.sp.gov.br/api/smv/";
  //static String apiUrl_Tele = "http://10.146.28.176:8095/mv/";
  static UsuarioLogadoModel? usuario;
  static String? globalName;
  static double sizeText = 32;
}
