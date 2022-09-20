import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AlertBeneficiary {
  void showBeneficiaryAlert(context) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: 'Atenção!',
          contentText: "Este usuário possui dados incompletos para finalizar a"
              " requisição, tente novamente mais tarde ou contate o suporte!",
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
}
