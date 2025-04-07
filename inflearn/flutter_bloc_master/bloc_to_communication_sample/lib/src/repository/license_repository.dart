import 'dart:async';

class LicenseRepository {
  StreamController<bool> changeLicenseStatus = StreamController<bool>.broadcast();
  late Stream<bool> stream;

  LicenseRepository() {
    stream = changeLicenseStatus.stream;
  }

  Future<bool> buyLicense() async {
    await Future.delayed(const Duration(microseconds: 800));
    changeLicenseStatus.sink.add(true);
    return true;
  }
}
