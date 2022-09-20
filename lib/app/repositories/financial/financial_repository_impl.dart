import 'dart:developer' as dev;
import 'package:dio/dio.dart';
import 'package:iamspeapp/app/core/exceptions/failure.dart';
import 'package:iamspeapp/app/repositories/financial/financial_repository.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/models/declaracaoRenda.model.dart';
import 'package:iamspeapp/models/boletoPdf.model.dart';
import 'package:iamspeapp/models/boleto.model.dart';

class FinancialRepositoryImpl implements FinancialRepository {
  Dio dio = Dio();
  @override
  Future<DeclaracaoRendaModel> getDeclarationData(
    String? idBeneficiary,
    String? idMed,
    String accessToken,
  ) async {
    try {
      final String url =
          "${Settings.apiUrl}financeiro/$idBeneficiary/declaracoes/$idMed";
      dev.log("url----------------" + url);
      dev.log("token----------------" + accessToken);
      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + accessToken,
          },
        ),
      );
      dev.log("Response status: ${response.statusCode}");
      dev.log("Response body: ${response.data}");
      DeclaracaoRendaModel declaration = DeclaracaoRendaModel();
      declaration = DeclaracaoRendaModel.fromJson(response.data);
      return declaration;
    } on DioError catch (e) {
      dev.log(
        'Erro de exception getDeclarationData',
        error: e.response!,
      );
      throw Failure();
    }
  }

  @override
  Future<List<DeclaracaoRendaModel?>> getStatements(
    String? idBeneficiary,
    String accessToken,
  ) async {
    try {
      final String url =
          "${Settings.apiUrl}financeiro/$idBeneficiary/declaracoes";
      dev.log("url----------------" + url);
      dev.log("token----------------" + accessToken);
      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + accessToken,
          },
        ),
      );
      dev.log("Response status: ${response.statusCode}");
      dev.log("Response body: ${response.data}");
      List<DeclaracaoRendaModel> statements;
      statements = (response.data as List)
          .map((i) => DeclaracaoRendaModel.fromJson(i))
          .toList();
      return statements;
    } on DioError catch (e) {
      dev.log(
        'Erro de exception getStatements',
        error: e.response!,
      );
      throw Failure();
    }
  }

  @override
  Future<List<BoletoModel?>> getTicket(
    String? idBeneficiary,
    String accessToken,
  ) async {
    try {
      final String url = "${Settings.apiUrl}financeiro/$idBeneficiary/boletos";
      dev.log("url----------------" + url);
      dev.log("token----------------" + accessToken);
      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + accessToken,
          },
        ),
      );
      dev.log("Response status: ${response.statusCode}");
      dev.log("Response body: ${response.data}");
      List<BoletoModel> tickets =
          (response.data as List).map((i) => BoletoModel.fromJson(i)).toList();
      return tickets;
    } on DioError catch (e) {
      dev.log(
        'Erro de exception getTicket',
        error: e.response!,
      );
      throw Failure();
    }
  }

  @override
  Future<BoletoPdfModel?> getTicketPdf(
    String? idBeneficiary,
    String? idTitle,
    String accessToken,
  ) async {
    try {
      final String url =
          "${Settings.apiUrl}financeiro/$idBeneficiary/boletos/$idTitle";
      dev.log("url----------------" + url);
      dev.log("token----------------" + accessToken);
      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + accessToken,
          },
        ),
      );
      dev.log("Response status: ${response.statusCode}");
      dev.log("Response body: ${response.data}");
      return BoletoPdfModel.fromJson(response.data);
    } on DioError catch (e) {
      dev.log(
        'Erro de exception getTicketPdf',
        error: e.response!,
      );
      throw Failure();
    }
  }
}
