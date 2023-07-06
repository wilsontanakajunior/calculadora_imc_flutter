import 'package:calculadora_imc/pages/imc_page.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext bc) {
                          return Wrap(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                leading: const Icon(Icons.camera),
                                title: const Text(
                                  "Câmera",
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                leading: const Icon(Icons.album_outlined),
                                title: const Text(
                                  "Galeria",
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: Container(),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: UserAccountsDrawerHeader(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      accountName: Text(
                        "Wilson Tanaka",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      accountEmail: Text(
                        "email@email.com",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      currentAccountPicture: ClipOval(
                        child: Image.asset(
                          "assets/images/profile.jpg",
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ImcPage();
                            },
                          ),
                        );
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.home),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Minhas pesagens",
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(Icons.home),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Minhas pesagens",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              padding: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.close),
                  Text("Sair"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
