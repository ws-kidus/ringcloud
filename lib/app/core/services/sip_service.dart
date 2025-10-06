import 'package:ringsipsdk/ringsipsdk.dart';

enum SipConnectionState { loading, connected, disconnected }

abstract class SipService {
  Future<void> init();

  Future<void> connect();

  Future<void> disconnect();

  Stream<SipConnectionState> getConnectionStatus();

  call({required String number});

  end();

  getCurrentCall();

  mute();

  unMute();

  hold();

  unHold();

  outputSpeaker();

  outputEarpiece();

  sendDTMF({required String number});

  blindTransfer({required String number});

  attendedTransfer({required String number});

  Stream<SipCallState> getCallState();
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
        port: "8089",
        displayName: "Kidus G/Michael",
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

  @override
  call({required String number}) {
    return _sipManager.startCall(number);
  }

  @override
  end() {
    return _sipManager.endCall();
  }

  @override
  getCurrentCall() {
    // TODO: implement getCurrentCall
    throw UnimplementedError();
  }

  @override
  mute() {
    return _sipManager.muteCall();
  }

  @override
  unMute() {
    return _sipManager.unmuteCall();
  }

  @override
  hold() {
    return _sipManager.holdCall();
  }

  @override
  unHold() {
    return _sipManager.unholdCall();
  }

  @override
  outputSpeaker() {
    return _sipManager.toggleSpeaker();
  }

  @override
  outputEarpiece() {
    return _sipManager.toggleSpeaker();
  }

  @override
  sendDTMF({required String number}) {
    return _sipManager.sendDtmf(number);
  }

  @override
  blindTransfer({required String number}) {
    return _sipManager.sendDtmf("1");
  }

  @override
  attendedTransfer({required String number}) {
    return _sipManager.sendDtmf("2");
  }

  @override
  Stream<SipCallState> getCallState() {
    // TODO: implement getCallState
    throw UnimplementedError();
  }
}
