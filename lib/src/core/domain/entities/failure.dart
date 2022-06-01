import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._();
  const factory Failure.internal([String? message]) = _Internal;
}

String mapFailureToString(Failure failure) {
  return failure.when(
    internal: (String? message) => message ?? "Internal issue has been occured",
  );
}
