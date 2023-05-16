import 'package:buscar_usuario/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardUser extends StatefulWidget {
  const CardUser({Key? key}) : super(key: key);

  @override
  State<CardUser> createState() => _CardUserState();
}

class _CardUserState extends State<CardUser> {
  var userC = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      //color: Colors.red,
      child: Container(
        height: 180,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(userC.preference.value!.results
                                .first.picture.large)),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 260,
                        child: Expanded(
                          child: Text(
                            '${userC.preference.value!.results.first.name.title}. ${userC.preference.value!.results.first.name.first} ${userC.preference.value!.results.first.name.last}',
                            style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        userC.preference.value!.results.first.email,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        userC.preference.value!.results.first.phone,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 260,
                        child: Expanded(
                          child: Text(
                            '${userC.preference.value!.results.first.location.city}, ${userC.preference.value!.results.first.location.state}, ${userC.preference.value!.results.first.location.postcode}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 155,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.orange[900]),
                      onPressed: () {
                        userC.preference.value = null;
                      },
                      child: const Text('Ignorar'),
                    ),
                  ),
                  SizedBox(
                    width: 155,
                    child: ElevatedButton(
                      onPressed: () {
                        userC.listUser.add(userC.preference.value);
                        print(userC.listUser);
                        userC.preference.value = null;
                        userC.preference.refresh();
                      },
                      child: const Text('Registrar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
