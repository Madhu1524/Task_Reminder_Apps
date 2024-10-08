// To parse this JSON data, do
//
//     final signupForm = signupFormFromJson(jsonString);

import 'dart:convert';

List<SignupForm> signupFormFromJson(String str) => List<SignupForm>.from(json.decode(str).map((x) => SignupForm.fromJson(x)));

String signupFormToJson(List<SignupForm> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SignupForm {
  String userName;
  String firstName;
  String lastName;
  String password;

  SignupForm({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.password,
  });

  SignupForm copyWith({
    String? userName,
    String? firstName,
    String? lastName,
    String? password,
  }) =>
      SignupForm(
        userName: userName ?? this.userName,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
      );

  factory SignupForm.fromJson(Map<String, dynamic> json) => SignupForm(
    userName: json["userName"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "FirstName": firstName,
    "LastName": lastName,
    "password": password,
  };
}
