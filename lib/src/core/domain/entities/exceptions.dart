class ServerException implements Exception {}

class InternalCacheException implements Exception {
  final String message;

  const InternalCacheException({
    required this.message,
  });
}
