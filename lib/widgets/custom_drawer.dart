import 'package:calculadora_imc/pages/imc_page.dart';
import 'package:calculadora_imc/pages/login_page.dart';
import 'package:calculadora_imc/respositories/imc_repository.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.imcRepository});
  final ImcRepository imcRepository;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                          "assets/images/profile.png",
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
                              return ImcPage(
                                imcRepository: imcRepository,
                              );
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
                  const Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext bc) {
                            return Container(
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: Column(
                                children: [
                                  const Text(
                                    "Calculadora Imc DIO",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 18.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Text(
                                              "Este projeto foi cuidadosamente desenvolvido como parte da certificação de conhecimento adquirido no módulo de Navegação e Widgets no Flutter, oferecido pela formação Flutter Specialist. Através dessa experiência, buscamos demonstrar habilidades intermediárias em Flutter, aplicando conceitos essenciais de navegação entre telas e a criação de diversos widgets personalizados.",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey.shade700,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Este projeto foi cuidadosamente desenvolvido como parte da certificação de conhecimento adquirido no módulo de Navegação e Widgets no Flutter, oferecido pela formação Flutter Specialist. Através dessa experiência, buscamos demonstrar habilidades intermediárias em Flutter, aplicando conceitos essenciais de navegação entre telas e a criação de diversos widgets personalizados.",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey.shade700,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Durante o desenvolvimento deste projeto, foram explorados diversos recursos do Flutter, como a utilização de rotas e navegação entre telas, a criação de layouts responsivos e a implementação de funcionalidades interativas. Além disso, foram aplicados princípios de design e boas práticas de desenvolvimento para garantir uma experiência agradável ao usuário.",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey.shade700,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Uma das principais características deste projeto é a integração de um widget personalizado, que permite ao usuário calcular o Índice de Massa Corporal (IMC) de forma prática e precisa. O IMC é uma medida amplamente utilizada para avaliar o estado nutricional de uma pessoa com base em seu peso e altura. Com essa funcionalidade, os usuários podem monitorar sua saúde e adquirir conhecimentos sobre suas condições físicas.",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey.shade700,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "O projeto também inclui recursos adicionais, como a exibição de resultados de IMC em diferentes categorias, como 'Magreza', 'Normal', 'Sobrepeso', 'Obesidade' e 'Obesidade Grave', fornecendo informações valiosas sobre a condição física do usuário.",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey.shade700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.settings),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Sobre o app",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextButton(
                      child: const Row(
                        children: [
                          Icon(Icons.close),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Sair",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (BuildContext bc) {
                          return const LoginPage();
                        }));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
