import 'package:buscar_usuario/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'components/card_user.dart';
import 'components/user_registration.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userC = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Usuários do app'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Obx(
            () => Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                userC.loadPreferences.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          userC.getUser();
                        },
                        child: const Text('Buscar usuário'),
                      ),
                const SizedBox(
                  height: 10,
                ),
                userC.preference.value != null
                    ? const CardUser()
                    : const Text('Não foi encontrado Usuarios.'),
                const SizedBox(
                  height: 40,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Usuários registrados',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                userC.listUser.isEmpty
                    ? const SizedBox()
                    : Expanded(
                        child: ListView.builder(
                          itemCount: userC.listUser.length,
                          itemBuilder: (context, index) {
                            return UserRegistration(
                              name:
                                  '${userC.listUser[index]!.results.first.name.title}. ${userC.listUser[index]!.results.first.name.first} ${userC.listUser[index]!.results.first.name.last}',
                              urlImage: userC
                                  .listUser[index]!.results.first.picture.large,
                              user: userC.listUser[index]!,
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
