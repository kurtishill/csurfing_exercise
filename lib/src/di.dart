import 'package:application/application.dart' as application;
import 'package:data/data.dart' as data;
import 'package:get_it/get_it.dart';

Future<GetIt> di() async {
  final getIt = GetIt.asNewInstance();

  application.di(getIt);
  data.di(getIt);

  return getIt;
}
