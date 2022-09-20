import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/modules/accredited_network/accredited_controller.dart';
import 'package:iamspeapp/app/controllers/beneficiary_controller.dart';
import 'package:iamspeapp/app/controllers/declaration_schedule_controller.dart';
import 'package:iamspeapp/app/controllers/insert_escort_controller.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/app/controllers/qr_escort_controller.dart';
import 'package:iamspeapp/app/controllers/schedule_controller.dart';
import 'package:iamspeapp/app/controllers/scorts_controller.dart';
import 'package:iamspeapp/app/controllers/tax_declaration_controller.dart';
import 'package:iamspeapp/app/controllers/telemedicine_controller.dart';
import 'package:iamspeapp/app/controllers/ticket_controller.dart';
import 'package:iamspeapp/app/controllers/wallet_controller.dart';
import 'package:iamspeapp/app/modules/accredited_network/accredited_store.dart';
import 'package:iamspeapp/stores/onboarding_store.dart';
import 'package:iamspeapp/views/statement_attendance_view.dart';
import 'package:iamspeapp/stores/aggregate_escort_store.dart';
import 'package:iamspeapp/stores/beneficiary_store.dart';
import 'package:iamspeapp/stores/declaration_schedule_list_store.dart';
import 'package:iamspeapp/stores/initial_store.dart';
import 'package:iamspeapp/stores/registration_data_store.dart';
import 'package:iamspeapp/stores/statement_attendance_store.dart';
import 'package:iamspeapp/stores/ticket_store.dart';
import 'package:iamspeapp/views/aggregate_escort_view.dart';
import 'package:iamspeapp/views/insert_escort_view.dart';
import 'package:iamspeapp/stores/insert_escort_store.dart';
import 'package:iamspeapp/stores/qr_escort_store.dart';
import 'package:iamspeapp/stores/escorts_store.dart';
import 'package:iamspeapp/views/escorts_view.dart';
import 'package:iamspeapp/views/declaration_schedule_view.dart';
import 'package:iamspeapp/views/attendance_view.dart';
import 'package:iamspeapp/stores/schedule_store.dart';
import 'package:iamspeapp/stores/telemedicine_store.dart';
import 'package:iamspeapp/views/declaration_list_view.dart';
import 'package:iamspeapp/views/declaration_data_view.dart';
import 'package:iamspeapp/stores/tax_declaration_store.dart';
import 'package:iamspeapp/views/financial_view.dart';
import 'package:iamspeapp/views/my_schedules_view.dart';
import 'package:iamspeapp/views/qr_escort_view.dart';
import 'package:iamspeapp/views/schedule_choose_view.dart';
import 'package:iamspeapp/views/ticket_list_view.dart';
import 'package:iamspeapp/views/ticket_pdf_view.dart';
import 'package:iamspeapp/views/user_profile_view.dart';
import 'package:iamspeapp/views/wallet_data_view.dart';
import 'package:iamspeapp/stores/wallet_store.dart';
import 'package:iamspeapp/views/wallet_view.dart';
import 'package:iamspeapp/views/beneficiary_data_view.dart';
import 'package:iamspeapp/views/registration_data_view.dart';
import 'package:iamspeapp/views/choose_escorts_view.dart';
import 'package:iamspeapp/views/about_app_view.dart';
import 'package:iamspeapp/app/modules/accredited_network/accredited_view.dart';
import 'package:iamspeapp/views/telemedicine_view.dart';
import 'package:iamspeapp/views/initial_view.dart';
import 'package:iamspeapp/views/login_view.dart';
import 'package:iamspeapp/views/first_access_view.dart';
import 'package:iamspeapp/stores/login_store.dart';
import 'package:iamspeapp/stores/splashscreen_store.dart';
import 'package:iamspeapp/views/splashscreen_view.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => SplashScreenStore()),
    Bind((i) => LoginStore()),
    Bind((i) => LoginController()),
    Bind((i) => WalletStore()),
    Bind((i) => WalletController()),
    Bind((i) => TaxDeclarationStore()),
    Bind((i) => TaxDeclarationController()),
    Bind((i) => ScheduleStore()),
    Bind((i) => ScheduleController()),
    Bind((i) => AccreditedStore()),
    Bind((i) => AccreditedController()),
    Bind((i) => TelemedicineStore()),
    Bind((i) => TelemedicineController()),
    Bind((i) => ScortsStore()),
    Bind((i) => ScortsController()),
    Bind((i) => QrEscortStore()),
    Bind((i) => QrEscortController()),
    Bind((i) => InsertEscortStore()),
    Bind((i) => InsertEscortController()),
    Bind((i) => RegistrationDataStore()),
    Bind((i) => BeneficiaryStore()),
    Bind((i) => BeneficiaryController()),
    Bind((i) => TicketStore()),
    Bind((i) => TicketController()),
    Bind((i) => DeclarationScheduleListStore()),
    Bind((i) => DeclarationScheduleController()),
    Bind((i) => AggregateEscortStore()),
    Bind((i) => InitialStore()),
    Bind((i) => StatementAttendanceStore()),
    Bind((i) => OnboardingStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const SplashScreenPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/login',
      child: (_, args) => const LoginPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/onboarding_page',
      child: (_, args) => const FirstAccessPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/inicial',
      child: (_, args) => const InitialPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/schedule',
      child: (_, args) => const MySchedulesPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/declaracao-lista',
      child: (_, args) => const DeclarationSchedulePage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/escorts/choose',
      child: (_, args) => const ChooseScorts(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/escorts/registration',
      child: (_, args) => const EscortsPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/escorts/qr',
      child: (_, args) => const QRCodeEscortPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/escorts/insert',
      child: (_, args) => const InsertEscortPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/escorts/aggregate',
      child: (_, args) => const AggregateEscortPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/registration-data',
      child: (_, args) => const RegistrationDataPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/beneficiary/data',
      child: (_, args) => const DadosBeneficiariosPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/attendance',
      child: (_, args) => const AttendancePage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/about',
      child: (_, args) => const AboutAppPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/wallet',
      child: (_, args) => const WalletPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/wallet/user',
      child: (_, args) => const WalletDataPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/telemedicine',
      child: (_, args) => const TelemedicinePage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/financial',
      child: (_, args) => const FinancialPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/accredited',
      child: (_, args) => const AccreditedPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/declaration/page',
      child: (_, args) => const DeclarationListView(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/declaration/data',
      child: (_, args) => const DeclarationDataView(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/ticket/list',
      child: (_, args) => const TicketListViewPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/ticket/pdf',
      child: (_, args) => const TicketPdfPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/schedule/choose',
      child: (_, args) => const ScheduleChoosePage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/declaration/schedule',
      child: (_, args) => const DeclarationSchedulePage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/declaration/attendance',
      child: (_, args) => const StatementAttendancePage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/user/profile',
      child: (_, args) => const UserProfilePage(),
      transition: TransitionType.fadeIn,
    ),
  ];
}
