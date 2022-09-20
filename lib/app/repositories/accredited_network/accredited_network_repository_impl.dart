import 'dart:developer' as dev;
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iamspeapp/app/core/exceptions/accredited_network/accredited_network_failure.dart';
import 'package:iamspeapp/app/repositories/accredited_network/accredited_network_repository.dart';
import 'package:iamspeapp/models/rede-credenciada/especialidades.model.dart';
import 'package:iamspeapp/models/rede-credenciada/credenciados.model.dart';
import 'package:iamspeapp/models/rede-credenciada/cidades.model.dart';

class AccreditedNetworkRepositoryImpl implements AccreditedNetworkRepository {
  Dio dio = Dio();
  @override
  Future<Either<AccreditedNetworkFailure, List<CredenciadosModel>>>
      getAccredited(
    int? codSpecialties,
    int? codCity,
  ) async {
    try {
      late String url;
      if (codSpecialties != null && codCity == null) {
        url = "http://www.iamspe.sp.gov.br/rede/"
            "djson.php?p1=f3&p2=$codSpecialties";
      } else if (codSpecialties == null && codCity != null) {
        url = "http://www.iamspe.sp.gov.br/rede/"
            "djson.php?p1=f3&p3=$codCity";
      } else if (codSpecialties != null && codCity != null) {
        url = "http://www.iamspe.sp.gov.br/rede/"
            "djson.php?p1=f3&p2=$codSpecialties&p3=$codCity";
      }
      dev.log(
        'url---------$url---------e-$codSpecialties----c-$codCity',
      );
      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
          },
        ),
      );
      dev.log("Response body: ${response.data}");

      List<CredenciadosModel> accredited = (response.data as List)
          .map((i) => CredenciadosModel.fromJson(i))
          .toList();
      return right(accredited);
    } on DioError catch (e) {
      dev.log(
        'Erro de exception getAccredited',
        error: e.response!.data.toString(),
      );
      if (e.response?.statusCode == 404 || e.response?.statusCode == 403) {
        return left(AccreditedNetworkNotFoundFailure());
      }
      return left(AccreditedNetworkServerErrorFailure(error: e.error));
    } catch (e) {
      return left(AccreditedNetworkServerErrorFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<AccreditedNetworkFailure, List<CidadesModel>>>
      getCities() async {
    try {
      const String url = "http://www.iamspe.sp.gov.br/rede/djson.php?p1=f4";
      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
          },
        ),
      );
      List<CidadesModel> cities =
          (response.data as List).map((i) => CidadesModel.fromJson(i)).toList();
      return right(cities);
    } on DioError catch (e) {
      dev.log(
        'Erro de exception get cities',
        error: e.response!.data.toString(),
      );
      if (e.response?.statusCode == 404 || e.response?.statusCode == 403) {
        return left(AccreditedNetworkNotFoundFailure());
      }
      return left(AccreditedNetworkServerErrorFailure(error: e.error));
    } catch (e) {
      return left(AccreditedNetworkServerErrorFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<AccreditedNetworkFailure, List<CidadesModel>>>
      getCitiesBySpecialties(int codSpecialties) async {
    try {
      final String url = "http://www.iamspe.sp.gov.br/rede"
          "/djson.php?p1=f6&p2=$codSpecialties";
      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
          },
        ),
      );
      List<CidadesModel> cities =
          (response.data as List).map((i) => CidadesModel.fromJson(i)).toList();
      return right(cities);
    } on DioError catch (e) {
      dev.log(
        'Erro de exception getCitiesBySpecialties',
        error: e.response!.data.toString(),
      );
      if (e.response?.statusCode == 404 || e.response?.statusCode == 403) {
        return left(AccreditedNetworkNotFoundFailure());
      }
      return left(AccreditedNetworkServerErrorFailure(error: e.error));
    } catch (e) {
      return left(AccreditedNetworkServerErrorFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<AccreditedNetworkFailure, List<EspecialidadesModel>>>
      getSpecialties() async {
    try {
      const String url = "http://www.iamspe.sp.gov.br/rede/djson.php?p1=f1";

      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
          },
        ),
      );
      dev.log("Response body: ${response.data}");
      List<EspecialidadesModel> specialties = (response.data as List)
          .map((i) => EspecialidadesModel.fromJson(i))
          .toList();
      return right(specialties);
    } on DioError catch (e) {
      dev.log(
        'Erro de exception getSpecialties',
        error: e.response!.data.toString(),
      );
      if (e.response?.statusCode == 404 || e.response?.statusCode == 403) {
        return left(AccreditedNetworkNotFoundFailure());
      }
      return left(AccreditedNetworkServerErrorFailure(error: e.error));
    } catch (e) {
      return left(AccreditedNetworkServerErrorFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<AccreditedNetworkFailure, List<EspecialidadesModel>>>
      getSpecialtiesByCity(
    int codCity,
  ) async {
    try {
      final String url =
          "http://www.iamspe.sp.gov.br/rede/djson.php?p1=f5&p2=$codCity";

      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
          },
        ),
      );
      List<EspecialidadesModel> specialties = (response.data as List)
          .map((i) => EspecialidadesModel.fromJson(i))
          .toList();
      return right(specialties);
    } on DioError catch (e) {
      dev.log(
        'Erro de exception getSpecialtiesByCity',
        error: e.response!.data.toString(),
      );
      if (e.response?.statusCode == 404 || e.response?.statusCode == 403) {
        return left(AccreditedNetworkNotFoundFailure());
      }
      return left(AccreditedNetworkServerErrorFailure(error: e.error));
    } catch (e) {
      return left(AccreditedNetworkServerErrorFailure(error: e.toString()));
    }
  }
}
