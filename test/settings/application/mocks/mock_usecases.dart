import 'package:blog/src/settings/domain/usecases/load_theme.dart';
import 'package:blog/src/settings/domain/usecases/update_theme.dart';
import 'package:mocktail/mocktail.dart';

class MockUpdateTheme extends Mock implements UpdateTheme {}

class MockLoadTheme extends Mock implements LoadTheme {}
