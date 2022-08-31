import 'package:eunice_template/app/di/data/datasource_injection.dart';
import 'package:eunice_template/app/di/data/repository_injection.dart';
import 'package:get_it/get_it.dart';

extension AppGetIt on GetIt {
  Future<void> init() async {
    await setupDatasource();
    setupRepository();
  }
}
