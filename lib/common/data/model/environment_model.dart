

class EnvironmentModel{
  final String baseUrl;
  final String environmentType;
  final String apiKey;
  final String apiSecret;
  final String apiVersion;

  const EnvironmentModel({
    required this.baseUrl,
    required this.environmentType,
    required this.apiKey,
    required this.apiSecret,
    required this.apiVersion,
  });
}