class SignInModel {
  String? token;

  SignInModel({
    this.token,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
