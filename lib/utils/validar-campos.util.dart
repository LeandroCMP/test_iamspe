import 'package:cpf_cnpj_validator/cpf_validator.dart';

class ValidarCampos {}

String? campoEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern);
  if (value!.isEmpty) {
    return "Informe o Email";
  } else if (!regExp.hasMatch(value)) {
    return "Email inválido";
  } else {
    return null;
  }
}

String? campoCpf(var value) {
  String pattern = r'^([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2})$';
  RegExp regExp = RegExp(pattern);
  if (value.length == 0) {
    return "Informe o CPF";
  } else if (!regExp.hasMatch(value)) {
    return "CPF inválido";
  } else {
    return null;
  }
}

String? campoVazio(String? value) {
  if (value!.isEmpty) {
    return "Esse campo é obrigatorio";
  } else {
    return null;
  }
}

String? cpfValido(String? cpf) {
  if (cpf == null) return "Informe o CPF";
  final validation = CPFValidator.isValid(cpf);
  if (validation == true) {
    return null;
  } else {
    return 'CPF inválido';
  }
}
