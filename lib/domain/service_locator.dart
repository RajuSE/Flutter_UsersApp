
import 'package:hdfc_test/domain/user_service.dart';

class ServiceLocator {
  static final UserService _userService = UserService();

  static UserService get userService => _userService;
}
