import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String email;
  final String uuid;
  final String? username;
  final String? alternate_email;
  final String? phoneNumber;
  final List<String>? preferredMinistries;
  final String? fcmToken;
  final List<String>? bookmarks;

  User({
    required this.email,
    required this.uuid,
    this.username,
    this.alternate_email,
    this.phoneNumber,
    this.preferredMinistries,
    this.fcmToken,
    this.bookmarks,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'uuid': uuid,
      if (username != null) 'username': username,
      if (alternate_email != null) 'alternate_email': alternate_email,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (preferredMinistries != null && preferredMinistries!.isNotEmpty)
        'preferred_ministries': preferredMinistries,
      if (fcmToken != null) 'fcm_token': fcmToken,
      if (bookmarks != null) 'bookmarks': bookmarks,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] as String,
      uuid: map['uuid'] as String,
      username: map['username'] != null ? map['username'] as String : null,
      alternate_email: map['alternate_email'] != null
          ? map['alternate_email'] as String
          : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      preferredMinistries: map['preferred_ministries'] != null
          ? List<String>.from((map['preferred_ministries'] as List<String>))
          : [],
      fcmToken: map['fcm_token'] != null ? map['fcm_token'] as String : null,
      bookmarks: map['bookmarks'] != null
          ? List<String>.from((map['bookmarks'] as List<String>))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
