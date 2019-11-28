class Hosts {
  List<Map> host = new List();

  Hosts() {
    host.add({'name': 'sit环境', 'host': 'http://sit-m.meitun.com'});
    host.add({'name': 'online环境', 'host': 'http://m.meitun.com'});
  }
}