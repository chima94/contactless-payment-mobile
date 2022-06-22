import 'package:contactless_payment_app/bootstrap.dart';
import 'package:contactless_payment_app/data/exception/remote_data_source_exception.dart';
import 'package:contactless_payment_app/data/local/local_datasource.dart';
import 'package:contactless_payment_app/data/local/shared_pref_util.dart';
import 'package:contactless_payment_app/data/remote/api_service.dart';
import 'package:contactless_payment_app/data/remote/remote_datasource.dart';
import 'package:contactless_payment_app/data/user_repository_Imp.dart';
import 'package:contactless_payment_app/domain/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const RemoteDatasource remoteDatasource = ApiService();
  final rxPrefs = RxSharedPreferences.getInstance();
  final LocalDataSource localDataSource = SharedPrefUtil(rxPrefs);
  final UserRepository userRepository =
      UserRepositoryImp(remoteDatasource, localDataSource);
  bootstrap(userRepository);
}
