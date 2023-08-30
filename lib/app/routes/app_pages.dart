import 'package:get/get.dart';
import '../modules/create_agenda/bindings/create_agenda_binding.dart';
import '../modules/create_agenda/views/create_agenda_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
// import '../modules/group/bindings/group_binding.dart';
import '../modules/group/views/group_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/insert_schedule/bindings/insert_schedule_binding.dart';
import '../modules/insert_schedule/views/insert_schedule_view.dart';
import '../modules/joinevent/bindings/joinevent_binding.dart';
import '../modules/joinevent/views/joinevent_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/management_user/bindings/management_user_binding.dart';
import '../modules/management_user/views/management_user_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';
import '../modules/token/bindings/token_binding.dart';
import '../modules/token/views/token_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.DASHBOARD;
  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INSERT_SCHEDULE,
      page: () => const InsertScheduleView(),
      binding: InsertScheduleBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.JOINEVENT,
      page: () => const JoineventView(),
      binding: JoineventBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.TOKEN,
      page: () => const TokenView(),
      binding: TokenBinding(),
    ),
    GetPage(
      name: _Paths.GROUP,
      page: () => const GroupView(),
      // binding: GroupBinding(),
    ),
    GetPage(
      name: _Paths.MANAGEMENT_USER,
      page: () => const ManagementUserView(),
      binding: ManagementUserBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_AGENDA,
      page: () => const CreateAgendaView(),
      binding: CreateAgendaBinding(),
    ),
  ];
}
