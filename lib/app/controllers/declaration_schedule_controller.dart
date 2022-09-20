import 'dart:developer' as dev;

import 'package:iamspeapp/app/repositories/schedule/schedule_repository_impl.dart';
import 'package:intl/intl.dart';

class DeclarationScheduleController {
  final repository = ScheduleRepositoryImpl();

  getData(user) async {
    dev.log(
      "-------------------funcao---------------1" +
          user!.cadBeneficiario!.prontuario.toString(),
    );
    final response = await repository.getStatementAttendance(
      user!.cadBeneficiario!.prontuario,
      user!.token!,
    );
    response.sort(
      (a, b) => b.dataHoraEntradaPaciente.compareTo(a.dataHoraEntradaPaciente),
    );
    for (var element in response) {
      element.dataHoraEntradaPaciente = DateFormat('dd/MM/yyyy HH:mm').format(
        DateTime.parse(
          element.dataHoraEntradaPaciente.split('.')[0],
        ),
      );
    }
    return response;
  }
}
