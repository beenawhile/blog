import 'package:blog/src/core/usecases/no_params.dart';
import 'package:blog/src/core/usecases/usecase.dart';
import 'package:blog/src/error/domain/failures.dart';
import 'package:blog/src/settings/domain/entities/settings.dart';
import 'package:blog/src/settings/domain/repositories/i_settings_repository.dart';
import 'package:dartz/dartz.dart';

class LoadTheme extends Usecase<Settings, NoParams> {
  final ISettingsRepository _repository;

  const LoadTheme({
    required ISettingsRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, Settings>> call(NoParams params) async {
    return await _repository.loadTheme();
  }
}
