import 'package:csurfing_exercise/src/di.dart';
import 'package:ui/ui.dart' as ui;

Future<void> setup() async {
  final getIt = await di();
  ui.setup(getIt);
}
