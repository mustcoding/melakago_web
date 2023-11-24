
import '../Controller/request_controller.dart';

class appUser {
  String firstName;
  String lastName;
  String nickName;
  String dateOfBirth;
  String phoneNumber;
  String email;
  String password;
  String accessStatus;
  String country;
  int roleId;


  appUser(this.firstName, this.lastName, this.nickName,
      this.dateOfBirth, this.phoneNumber,
      this.email, this.password, this.accessStatus, this.country ,this.roleId);


  appUser.fromJson(Map<String, dynamic> json)
      :
        firstName = json['firstName'] as String,
        lastName = json['lastName'] as String,
        nickName = json['nickName'] as String,
        dateOfBirth = json['dateOfBirth'] as String,
        phoneNumber = json['phoneNumber'] as String,
        email = json['email'] as String,
        password = json['password'] as String,
        accessStatus = json['accessStatus'] as String,
        country = json['country'] as String,
        roleId = json['roleId'] as dynamic;

  //toJson will be automatically called by jsonEncode when necessary
  Map<String, dynamic> toJson() =>
      {'firstName': firstName, 'lastName': lastName,
        'nickName': nickName, 'dateOfBirth': dateOfBirth,
        'phoneNumber': phoneNumber, 'email': email,
        'password': password, 'accessStatus': accessStatus,
        'country': country,'roleId': roleId};

  Future<bool> save() async {
    RequestController req = RequestController(path: "/api/appuser.php");
    req.setBody(toJson());
    await req.post();
    if (req.status() == 200) {
      return true;
    }
    return false;
  }

  Future<bool> isEmailRegistered(String email) async {
    RequestController req = RequestController(path: "/api/appuser.php");
    req.setBody({"email":email});
    await req.checkUser();
    if (req.status() == 200) {
      return true;
    }
    return false;
  }

  static Future<List<appUser>> loadAll() async{
    List<appUser> result = [];
    RequestController req = RequestController(path: "/api/appuser.php");
    await req.get();
    if (req.status() == 200 && req.result() != null){
      for(var item in req.result()){
        result.add(appUser.fromJson(item) as appUser);
      }
    }
    return result;
  }



}