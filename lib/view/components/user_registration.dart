import 'package:buscar_usuario/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../model/user_model.dart';

class UserRegistration extends StatefulWidget {
  final String name;
  final String urlImage;
  final UserModel user;
  const UserRegistration(
      {Key? key,
      required this.name,
      required this.urlImage,
      required this.user})
      : super(key: key);

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  var userC = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.urlImage)),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 230,
                    child: Expanded(
                      child: Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    userC.listUser.remove(widget.user);
                  });
                },
                icon: const Icon(
                  FontAwesomeIcons.trashCan,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
