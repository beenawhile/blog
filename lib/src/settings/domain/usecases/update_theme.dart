import 'package:blog/src/core/domain/entities/failure.dart';
import 'package:blog/src/core/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import 'package:blog/src/settings/domain/repositories/i_settings_repository.dart';

class UpdateTheme extends Usecase<Unit, String> {
  final ISettingsRepository _repository;
  const UpdateTheme({
    required ISettingsRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, Unit>> call(String params) async {
    return await _repository.updateTheme(params);
  }
}
