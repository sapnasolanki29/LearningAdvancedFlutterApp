import 'package:flutter/cupertino.dart';
import 'package:flutterprojects/Models/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
User? get user=> _user;
bool get isLoggedIn=>_user!=null;

void setUser( User user){
  _user=user;
  notifyListeners();
}
void logOut(){
  _user=null;
  notifyListeners();
}

}