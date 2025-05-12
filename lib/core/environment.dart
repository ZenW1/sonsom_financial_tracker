enum EnvironmentType { development, uat, production }

class Environment {
   static EnvironmentType _environment = EnvironmentType.development;

   void setEnvironment({required EnvironmentType environment}){
      _environment = environment;
   }

  static String baseUrl() {
    switch (_environment) {
      case EnvironmentType.development:
        return 'https://mlmu-hr-api.codexcambodia.com';
      case EnvironmentType.uat:
        return 'https://mlmu-hr-api.codexcambodia.com';
      case EnvironmentType.production:
        return 'https://mlmu-hr-api.codexcambodia.com';
      default:
        return '';
    }
  }

 static  String get baseAPIUrl => baseUrl();
}
