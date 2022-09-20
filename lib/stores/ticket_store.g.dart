// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TicketStore on _TicketStoreBase, Store {
  late final _$listaBoletosAtom =
      Atom(name: '_TicketStoreBase.listaBoletos', context: context);

  @override
  List<BoletoModel>? get listaBoletos {
    _$listaBoletosAtom.reportRead();
    return super.listaBoletos;
  }

  @override
  set listaBoletos(List<BoletoModel>? value) {
    _$listaBoletosAtom.reportWrite(value, super.listaBoletos, () {
      super.listaBoletos = value;
    });
  }

  late final _$selectedBoletoAtom =
      Atom(name: '_TicketStoreBase.selectedBoleto', context: context);

  @override
  List<TicketListViewPage>? get selectedBoleto {
    _$selectedBoletoAtom.reportRead();
    return super.selectedBoleto;
  }

  @override
  set selectedBoleto(List<TicketListViewPage>? value) {
    _$selectedBoletoAtom.reportWrite(value, super.selectedBoleto, () {
      super.selectedBoleto = value;
    });
  }

  late final _$sortAtom = Atom(name: '_TicketStoreBase.sort', context: context);

  @override
  bool? get sort {
    _$sortAtom.reportRead();
    return super.sort;
  }

  @override
  set sort(bool? value) {
    _$sortAtom.reportWrite(value, super.sort, () {
      super.sort = value;
    });
  }

  late final _$usuarioAtom =
      Atom(name: '_TicketStoreBase.usuario', context: context);

  @override
  UsuarioLogadoModel? get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(UsuarioLogadoModel? value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_TicketStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$ticketIsLoadingAtom =
      Atom(name: '_TicketStoreBase.ticketIsLoading', context: context);

  @override
  bool get ticketIsLoading {
    _$ticketIsLoadingAtom.reportRead();
    return super.ticketIsLoading;
  }

  @override
  set ticketIsLoading(bool value) {
    _$ticketIsLoadingAtom.reportWrite(value, super.ticketIsLoading, () {
      super.ticketIsLoading = value;
    });
  }

  late final _$arquivoAtom =
      Atom(name: '_TicketStoreBase.arquivo', context: context);

  @override
  BoletoPdfModel? get arquivo {
    _$arquivoAtom.reportRead();
    return super.arquivo;
  }

  @override
  set arquivo(BoletoPdfModel? value) {
    _$arquivoAtom.reportWrite(value, super.arquivo, () {
      super.arquivo = value;
    });
  }

  late final _$bytesAtom =
      Atom(name: '_TicketStoreBase.bytes', context: context);

  @override
  Uint8List? get bytes {
    _$bytesAtom.reportRead();
    return super.bytes;
  }

  @override
  set bytes(Uint8List? value) {
    _$bytesAtom.reportWrite(value, super.bytes, () {
      super.bytes = value;
    });
  }

  late final _$fileAtom = Atom(name: '_TicketStoreBase.file', context: context);

  @override
  File? get file {
    _$fileAtom.reportRead();
    return super.file;
  }

  @override
  set file(File? value) {
    _$fileAtom.reportWrite(value, super.file, () {
      super.file = value;
    });
  }

  late final _$pathPDFAtom =
      Atom(name: '_TicketStoreBase.pathPDF', context: context);

  @override
  String get pathPDF {
    _$pathPDFAtom.reportRead();
    return super.pathPDF;
  }

  @override
  set pathPDF(String value) {
    _$pathPDFAtom.reportWrite(value, super.pathPDF, () {
      super.pathPDF = value;
    });
  }

  late final _$pdfDataBytesAtom =
      Atom(name: '_TicketStoreBase.pdfDataBytes', context: context);

  @override
  List<int>? get pdfDataBytes {
    _$pdfDataBytesAtom.reportRead();
    return super.pdfDataBytes;
  }

  @override
  set pdfDataBytes(List<int>? value) {
    _$pdfDataBytesAtom.reportWrite(value, super.pdfDataBytes, () {
      super.pdfDataBytes = value;
    });
  }

  late final _$docAtom = Atom(name: '_TicketStoreBase.doc', context: context);

  @override
  PDFDocument? get doc {
    _$docAtom.reportRead();
    return super.doc;
  }

  @override
  set doc(PDFDocument? value) {
    _$docAtom.reportWrite(value, super.doc, () {
      super.doc = value;
    });
  }

  late final _$idTituloAtom =
      Atom(name: '_TicketStoreBase.idTitulo', context: context);

  @override
  String? get idTitulo {
    _$idTituloAtom.reportRead();
    return super.idTitulo;
  }

  @override
  set idTitulo(String? value) {
    _$idTituloAtom.reportWrite(value, super.idTitulo, () {
      super.idTitulo = value;
    });
  }

  late final _$idBeneficiarioAtom =
      Atom(name: '_TicketStoreBase.idBeneficiario', context: context);

  @override
  String? get idBeneficiario {
    _$idBeneficiarioAtom.reportRead();
    return super.idBeneficiario;
  }

  @override
  set idBeneficiario(String? value) {
    _$idBeneficiarioAtom.reportWrite(value, super.idBeneficiario, () {
      super.idBeneficiario = value;
    });
  }

  @override
  String toString() {
    return '''
listaBoletos: ${listaBoletos},
selectedBoleto: ${selectedBoleto},
sort: ${sort},
usuario: ${usuario},
isLoading: ${isLoading},
ticketIsLoading: ${ticketIsLoading},
arquivo: ${arquivo},
bytes: ${bytes},
file: ${file},
pathPDF: ${pathPDF},
pdfDataBytes: ${pdfDataBytes},
doc: ${doc},
idTitulo: ${idTitulo},
idBeneficiario: ${idBeneficiario}
    ''';
  }
}
