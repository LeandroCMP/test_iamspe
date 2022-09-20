import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/stores/splashscreen_store.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final store = Modular.get<SplashScreenStore>();

  @override
  void didChangeDependencies() {
    store.loadSplash(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'logo',
          child: Image.asset(
            'assets/logo_transparente.png',
          ),
        ),
      ),
    );
  }
}
