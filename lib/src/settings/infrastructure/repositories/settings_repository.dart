import 'package:blog/src/error/domain/exceptions.dart';
import 'package:blog/src/settings/domain/entities/settings.dart';
import 'package:blog/src/settings/infrastructure/datasources/settings_service.dart';
import 'package:dartz/dartz.dart';

import 'package:blog/src/error/domain/failures.dart';
import 'package:blog/src/settings/domain/repositories/i_settings_repository.dart';

class SettingsRepository implements ISettingsRepository {
  final SettingsService _service;

  const SettingsRepository({
    required SettingsService service,
  }) : _service = service;

  @override
  Future<Either<Failure, Settings>> loadTheme() async {
    try {
      return Right((await _service.themeMode).toDomain());
    } on InternalCacheException {
      return const Left(Failure.internal());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateTheme(String themeMode) async {
    try {
      await _service.updateThemeMode(themeMode);
      return const Right(unit);
    } on InternalCacheException {
      return const Left(Failure.internal());
    }
  }
}
