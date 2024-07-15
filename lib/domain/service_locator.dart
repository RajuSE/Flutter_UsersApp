
import 'package:devxraju_flutter_provider/domain/user_service.dart';

class ServiceLocator {
  static final UserService _userService = UserService();

  static UserService get userService => _userService;
}
