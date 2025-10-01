import 'package:ringsipsdk/ringsipsdk.dart';

enum SipConnectionState { loading, connected, disconnected }

abstract class SipService {
  Future<void> init();

  Future<void> connect();

  Future<void> disconnect();

  Stream<SipConnectionState> getConnectionStatus();

  // call({required String number});
  //
  // answer();
  //
  // end();
  //
  // getCurrentCall();
  //
  // mute();
  //
  // unMute();
  //
  // hold();
  //
  // unHold();
  //
  // outputSpeaker();
  //
  // outputEarpiece();
  //
  // sendDTMF({required String number});
  //
  // blindTransfer();
  //
  // attendedTransfer();
}

class SipServiceImpl implements SipService {
  final _sipManager = SipManager();

  @override
  Future<void> init() async {
    await _sipManager.start();
  }

  @override
  connect() async {
    await _sipManager.addAccount(
      UAccount(
        username: "277S837013",
        password: "gLMTUXP7wkr9WNOm",
        host: "etw-pbx-sip2.websprix.com",
        port: "5060",
        displayName: "Kidus G/Michael"
      ),
    );
  }

  @override
  disconnect() async {
    await _sipManager.unregister();
  }

  @override
  Stream<SipConnectionState> getConnectionStatus() {
    return _sipManager.stateStream.map<SipConnectionState>((value) {
      if (value.registrationState == RegistrationStateEnum.REGISTERED &&
          value.transportState == TransportStateEnum.CONNECTED) {
        return SipConnectionState.connected;
      }
      if (value.registrationState ==
              RegistrationStateEnum.REGISTRATION_FAILED ||
          value.registrationState == RegistrationStateEnum.UNREGISTERED ||
          value.transportState == TransportStateEnum.DISCONNECTED) {
        return SipConnectionState.disconnected;
      }
      return SipConnectionState.loading;
    });
  }
}
