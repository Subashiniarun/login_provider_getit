import 'package:flutter_provider_architecture/loginmodel.dart';
import 'package:get_it/get_it.dart';

import 'api.dart';
import 'auth.dart';
import 'contact_us/contact_page.dart';

GetIt locator = GetIt.instance;

void MyLoctor(){
  locator.registerLazySingleton(() => LoginModel());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => ContactPage());

}