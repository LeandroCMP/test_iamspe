import 'package:iamspeapp/models/agenda.model.dart';
import 'package:iamspeapp/models/declaracaoComparecimento.model.dart';

abstract class ScheduleRepository {
  Future<List<AgendaModel>?> getSchedules(
    int? chart,
    String accessToken,
  );
  Future<List<AgendaModel>?> getSchedulesHistory(
    int? chart,
    String accessToken,
  );
  Future<List<DeclaracaoComparecimentoModel>> getStatementAttendance(
    int? chart,
    String accessToken,
  );
}
