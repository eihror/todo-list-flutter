class SignInResponse {
  const SignInResponse({
    this.accessToken,
  });

  final String? accessToken;

  factory SignInResponse.fromMap(Map<String, dynamic> map) {
    return SignInResponse(
      accessToken: map['access_token'] as String?,
    );
  }
}
