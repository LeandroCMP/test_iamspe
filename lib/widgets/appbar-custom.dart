// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/alerts/alert_helper.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/stores/initial_store.dart';
import 'package:iamspeapp/views/components/text_component.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool? semVoltar;
  final bool? limparRotas;
  final bool? semMenu;
  final bool? hasName;
  final bool? hasNotification;
  final bool? hasSection;
  final String? section;
  final bool hasLogo;
  final String helperTitle;
  final String msg;
  const CustomAppBar({
    Key? key,
    this.semVoltar,
    this.semMenu,
    this.limparRotas,
    this.hasName,
    this.hasNotification,
    this.hasSection,
    this.section,
    required this.hasLogo,
    required this.helperTitle,
    required this.msg,
  })  : preferredSize = const Size.fromHeight(100),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool? naoVoltar;
  bool? menu;
  bool? limparRotas;
  bool? hasName;
  bool? hasNotification;
  bool? hasLogo;
  bool? hasSection;
  String? section;
  String? helperTitle;
  String? msg;
  @override
  void initState() {
    super.initState();
    widget.hasName == null ? hasName = false : hasName = widget.hasName;
    widget.hasNotification == null
        ? hasNotification = false
        : hasNotification = widget.hasNotification;
    // ignore: unnecessary_null_comparison
    widget.hasLogo == null ? hasLogo = false : hasLogo = widget.hasLogo;
    widget.hasSection == null
        ? hasSection = false
        : hasSection = widget.hasSection;
    hasSection == true ? section = widget.section : section = '';
    widget.semVoltar == null ? naoVoltar = false : naoVoltar = widget.semVoltar;
    widget.semMenu == null ? menu = false : menu = widget.semMenu;
    widget.limparRotas == null
        ? limparRotas = false
        : limparRotas = widget.limparRotas;
    helperTitle = widget.helperTitle;
    msg = widget.msg;
  }

  @override
  Widget build(BuildContext context) {
    final alertHelper = AlertHelper();
    return AppBar(
      centerTitle: hasName! == false && hasSection! == true ? true : false,
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.help_outline_outlined),
          color: Colors.white,
          iconSize: 25,
          onPressed: () {
            alertHelper.showHelperAlert(context, helperTitle, msg);
          },
        ),
        hasNotification! == true
            ? IconButton(
                icon: const Icon(Icons.notifications_none_rounded),
                color: Colors.white,
                iconSize: 25,
                onPressed: () {},
              )
            : const SizedBox(),
        hasLogo! == true
            ? Container(
                width: 70,
                margin: const EdgeInsets.only(top: 18, bottom: 18),
                padding: const EdgeInsets.all(05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Hero(
                  tag: 'logo',
                  child: Image.asset(
                    "assets/logo_transparente.png",
                  ),
                ),
              )
            : const SizedBox(),
        IconButton(
          icon: const Icon(Icons.menu_outlined),
          color: Colors.white,
          iconSize: 25,
          onPressed: () => Scaffold.of(context).openEndDrawer(),
        ),
      ],
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF7ec345),
              Color(0xFF03aabd),
            ],
            stops: [0.4, 0.8],
          ),
        ),
      ),
      leading: naoVoltar!
          ? null
          : limparRotas!
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    final initialStore = Modular.get<InitialStore>();
                    initialStore.callPage();
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Modular.to.pop(context),
                ),
      title: hasName! == false && hasSection! == true
          ? TextComponent(
              text: section!,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              textColor: Colors.white,
            )
          : hasName! == true
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextComponent(
                      text: 'Olá, ${Settings.globalName!}',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 05),
                    TextComponent(
                      text: 'Carteirinha: ${Settings.usuario?.carteira! ?? ""}',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      textColor: Colors.white,
                    ),
                  ],
                )
              : const SizedBox(),
    );
  }
}
