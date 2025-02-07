import 'package:creditcard/module/app/core/controllers/custom_controller.dart';
import 'package:creditcard/module/home/domain/enums/bottom_nav_bar_type.dart';

class BottomBarController extends CustomController<Exception, BottomNavBarType> {
  BottomBarController() : super(BottomNavBarType.home);

  void onChangeType(BottomNavBarType type) => update(type);

  void reset() {
    update(BottomNavBarType.home);
  }
}
