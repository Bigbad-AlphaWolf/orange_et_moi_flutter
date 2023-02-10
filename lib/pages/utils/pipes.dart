String formatGetMsisdn(String msisdnNetwork) {
  if (msisdnNetwork.startsWith('221')) {
    return msisdnNetwork.substring(3);
  } else {
    return msisdnNetwork;
  }
}
