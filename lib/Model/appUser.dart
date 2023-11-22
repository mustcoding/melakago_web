import 'package:melakago_web/Model/userRole.dart';

import '../Controller/request_controller.dart';

class appUser {
  int appUserId;
  String firstName;
  String lastName;
  String nickName;
  String dateOfBirth;
  String email;
  String password;
  String accessStatus;
  userRole roleId;

  appUser(this.appUserId, this.firstName, this.lastName, this.nickName,
      this.dateOfBirth,
      this.email, this.password, this.accessStatus, this.roleId);

  appUser.fromJson(Map<String, dynamic> json)
      : appUserId = int.parse(json['appUserId'] as dynamic),
        firstName = json['firstName'] as String,
        lastName = json['lastName'] as String,
        nickName = json['nickName'] as String,
        dateOfBirth = json['dateOfBirth'] as String,
        email = json['email'] as String,
        password = json['password'] as String,
        accessStatus = json['accessStatus'] as String,
        roleId = json['roleId'] as dynamic;

  //toJson will be automatically called by jsonEncode when necessary
  Map<String, dynamic> toJson() =>
      {'appUserId': appUserId, 'firstName': firstName, 'lastName': lastName,
        'nickName': nickName, 'dateOfBirth': dateOfBirth, 'email': email,
        'password': password, 'accessStatus': accessStatus, 'roleId': roleId};

  Future<bool> save() async {
    RequestController req = RequestController(path: "/api/appuser.php");
    req.setBody(toJson());
    await req.post();
    if (req.status() == 200) {
      return true;
    }
    return false;
  }

  static Future<List<userRole>> loadAll() async{
    List<userRole> result = [];
    RequestController req = RequestController(path: "/api/appuser.php");
    await req.get();
    if (req.status() == 200 && req.result() != null){
      for(var item in req.result()){
        result.add(appUser.fromJson(item) as userRole);
      }
    }
    return result;
  }

  static Future<List<userRole>> getAppUser(email) async{
    List<userRole> result = [];
    RequestController req = RequestController(path: "/api/appuser.php");
    await req.getUser(email);
    if (req.status() == 200 && req.result() != null){
      for(var item in req.result()){
        result.add(appUser.fromJson(item) as userRole);
      }
    }
    return result;
  }

}