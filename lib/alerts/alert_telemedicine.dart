import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/widgets/size-config.dart';

class AlertTelemedicine {
  mensagemAceiteCheckin(idItemAgenda, context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: const Text("Atenção"),
          content: const Text(
            "Está ciente que fará o check in na consulta sujeito as normas previstas?",
            textAlign: TextAlign.left,
          ),
          actions: <Widget>[
            // define os botões na base do dialogo
            TextButton(
              child: const Text("Sim"),
              onPressed: () => true,
            ),
            TextButton(
              child: const Text(
                "Cancelar",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Modular.to.pop();
              },
            ),
          ],
        );
      },
    );
  }

  void mensagemCheckinResultado(context, String mensagem, bool checkin) {
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: const Text("Atenção"),
          content: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              style: TextStyle(
                fontSize: sizeConfig.dynamicScaleSize(
                    size: 16, scaleFactorTablet: 2, scaleFactorMini: 0.8),
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(text: mensagem + "\n\n"),
                const TextSpan(
                    text:
                        "Para uma melhor experiência, faça download do Navegador Chrome."
                        "\n",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                // new TextSpan(
                //     text:
                //         "https://play.google.com/store/apps/details?id=com.android.chrome"),
              ],
            ),
          ),
          actions: <Widget>[
            // define os botões na base do dialogo
            TextButton(
              child: const Text(
                "Ir para link de download do Google Chrome",
                style: TextStyle(color: Colors.green),
                textAlign: TextAlign.end,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                //telemedicineStore.launchDownloadChrome();
              },
            ),
            TextButton(
              child: const Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
                if (checkin == true) {
                  //telemedicineStore.launchBrowser(
                  //telemedicineStore.retornoAtendimento.idAtendimento,
                  //);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
