import 'package:buscar_usuario/model/user_model.dart';
import 'package:http/http.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class UserController extends GetxController {
  var preference = Rx<UserModel?>(null);
  //UserModel listUser;
  var loadPreferences = false.obs;

  var listUser = RxList<UserModel?>();

  Future<bool> getUser() async {
    var client = Client();
    bool success = false;
    loadPreferences.value = true;
    try {
      var res = await client.get(Uri.parse('https://randomuser.me/api/'));

      if (res.statusCode == 200) {
        var data = convert.jsonDecode(convert.utf8.decode(res.bodyBytes));
        preference.value = UserModel.fromJson(data);
        success = true;
        print('data');
      }
      loadPreferences.value = false;
    } catch (e) {
      loadPreferences.value = false;
    }
    return success;
  }

  // var listPassengerTrips = RxList<UserModel>();
  // String url = 'https://randomuser.me/api/';
  // var loadUser = false.obs;

  // Future<bool> getUser() async {
  //   var client = Client();
  //   bool success = true;
  //   loadUser.value = true;

  //   var res = await client.get(url as Uri);

  // }
}
