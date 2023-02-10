import 'dart:convert';

TokenResponse tokenResponseFromJson(String str) =>
    TokenResponse.fromJson(json.decode(str));

String tokenResponseToJson(TokenResponse data) => json.encode(data.toJson());

class TokenResponse {
  TokenResponse({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshExpiresIn,
    this.refreshToken,
    required this.tokenType,
    this.idToken,
    required this.notBeforePolicy,
    this.sessionState,
    required this.scope,
    this.error,
    this.errorDescription,
    this.errorUri,
  });

  String accessToken;
  int expiresIn;
  int refreshExpiresIn;
  dynamic refreshToken;
  String tokenType;
  dynamic idToken;
  int notBeforePolicy;
  dynamic sessionState;
  String scope;
  dynamic error;
  dynamic errorDescription;
  dynamic errorUri;

  factory TokenResponse.fromJson(Map<String, dynamic> json) => TokenResponse(
        accessToken: json["access_token"],
        expiresIn: json["expires_in"],
        refreshExpiresIn: json["refresh_expires_in"],
        refreshToken: json["refresh_token"],
        tokenType: json["token_type"],
        idToken: json["id_token"],
        notBeforePolicy: json["not-before-policy"],
        sessionState: json["session_state"],
        scope: json["scope"],
        error: json["error"],
        errorDescription: json["error_description"],
        errorUri: json["error_uri"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "expires_in": expiresIn,
        "refresh_expires_in": refreshExpiresIn,
        "refresh_token": refreshToken,
        "token_type": tokenType,
        "id_token": idToken,
        "not-before-policy": notBeforePolicy,
        "session_state": sessionState,
        "scope": scope,
        "error": error,
        "error_description": errorDescription,
        "error_uri": errorUri,
      };
}
