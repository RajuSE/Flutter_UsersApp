
import 'package:get_it/get_it.dart';
import 'package:devxraju_flutter_provider/domain/user_service.dart';

final getIt = GetIt.instance;
void setupLocator(){
  getIt.registerLazySingleton<UserService>(() => UserService());
}
