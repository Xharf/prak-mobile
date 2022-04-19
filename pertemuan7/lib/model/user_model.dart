import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  UserModel({required this.fullname, required this.email, required this.password});

  @HiveField(0)
  String fullname;

  @HiveField(1)
  String email;

  @HiveField(2)
  String password;

  @override
  String toString() {
    return 'UserModel{fullname: $fullname}';
  }
}
