String formatGetMsisdn(String msisdnNetwork) {
  if (msisdnNetwork.startsWith('221')) {
    return msisdnNetwork.substring(3);
  } else {
    return msisdnNetwork;
  }
}

String getConsoTitle(String? category) {
  switch (category) {
    case "APPEL":
      return "Appels";
    case "INTERNET":
      return "Internet";
    case "SMS":
      return "Sms";
    default:
      return "";
  }
}

String getConsoRedirectionText(String category) {
  switch (category) {
    case "APPEL":
      return "Historique appels";
    case "INTERNET":
      return "Historique internet";
    case "SMS":
      return "Sms";
    default:
      return "";
  }
}
