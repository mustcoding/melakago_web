
import '../Controller/request_controller.dart';

class userRole{
  int roleId;
  String roleName;

  userRole(this.roleId, this.roleName);

  userRole.fromJson(Map<String, dynamic> json)
      : roleId = int.parse (json['roleId'] as dynamic),
        roleName = json['roleName'] as String;


  //toJson will be automatically called by jsonEncode when necessary
  Map<String, dynamic> toJson() => {'roleId':roleId, 'roleName':roleName};

  Future<bool> save() async{
    RequestController req = RequestController(path: "/api/userRole.php");
    req.setBody(toJson());
    await req.post();
    if(req.status()==200){
      return true;
    }
    return false;
  }

  static Future<List<userRole>> loadAll() async{
    List<userRole> result = [];
    RequestController req = RequestController(path: "/api/userRole.php");
    await req.get();
    if (req.status() == 200 && req.result() != null){
      for(var item in req.result()){
        result.add(userRole.fromJson(item));
      }
    }
    return result;
  }

}