import 'package:iamspeapp/models/telemedicina.model.dart';

abstract class TelemedicineService {
  Future<List<TelemedicinaModel>> getSchedules(
    int? chart,
    String accessToken,
  );
  Future<Object> postCheckIn(
    int? idItemSchedule,
    String accessToken,
  );
}
