

class Config {
  String baseUrl;
  int connectTimeout;
  int receiveTimeout;

  Config() {
    // this.baseUrl = 'http://sit-m.meitun.com';
    this.baseUrl = '';
    this.connectTimeout = 10000;
    this.receiveTimeout = 3000;
  }
}