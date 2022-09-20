import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AccreditedAlert {
  void showDialogAccredited(context) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: 'Atenção!',
          contentText:
              "Selecione no mínimo a especialidade ou o município a ser pesquisado!",
          positiveText: 'Ok',
          onPositiveClick: () {
            Modular.to.pop();
          },
        );
      },
      animationType: DialogTransitionType.fadeScale,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }

  /*void showDialogAccreditedResult(context, List<CredenciadosModel>? result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: const Text("Redes Credenciadas"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: result != null ? result.length : 0,
              itemBuilder: (context, index) {
                return Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFf0f0f0),
                    border: Border.all(
                      color: const Color(0xFFe6e6e6),
                    ),
                    borderRadius: BorderRadius.circular(05),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const TextComponent(
                            text: 'Município',
                            textColor: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          TextComponent(
                            text: result![index].municipio,
                            textColor: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const TextComponent(
                            text: 'Especialidade:',
                            textColor: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          TextComponent(
                            text: result[index].especialidade.toString(),
                            textColor: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            result[index].nome_credenciado.toString(),
                            softWrap: true,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.phone_outlined, size: 20),
                              const SizedBox(width: 10),
                              TextComponent(
                                text: result[index].telefone.toString(),
                                textColor: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          TextComponent(
                            text: result[index].logradouro.toString(),
                            textColor: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          TextComponent(
                            text: result[index].numero.toString(),
                            textColor: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          TextComponent(
                            text: result[index].cep.toString(),
                            textColor: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Ok',
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                Modular.to.pop();
              },
            ),
          ],
        );
      },
    );
  }*/
}
