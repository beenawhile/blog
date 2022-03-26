import 'package:blog/src/error/domain/failures.dart';
import 'package:blog/src/settings/domain/entities/settings.dart';
import 'package:dartz/dartz.dart';

abstract class ISettingsRepository {
  Future<Either<Failure, Settings>> loadTheme();
  Future<Either<Failure, Unit>> updateTheme(String themeMode);
}
