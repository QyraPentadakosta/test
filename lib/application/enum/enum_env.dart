enum EnumEnv {
  dev('.env.dev'),
  prod('.env.prod'),
  uat('.env.uat'),
  nodeEnv('NODE_ENV'),
  host('HOST'),
  appVersion('APP_VERSION');

  final String value;

  const EnumEnv(this.value);
}
