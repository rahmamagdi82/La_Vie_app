class LoginModel {
  String? type;
  String? message;
   Data? data;

  LoginModel({this.type, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
  }
}

class Data {
  User? user;
   String? accessToken;
  String? refreshToken;

  Data({this.user, this.accessToken, this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }
}

class User {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  Null? address;
  String? role;

  User(
      {this.userId,
        this.firstName,
        this.lastName,
        this.email,
        this.imageUrl,
        this.address,
        this.role,
      });

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    role = json['role'];
  }
}