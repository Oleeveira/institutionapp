import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:institutionapp/components/gallery.dart';
import 'package:institutionapp/components/gallery_state.dart';
import 'package:institutionapp/components/item_card_component.dart';
import 'package:institutionapp/components/profile_info_component.dart';

import '../components/visit_card.dart';

class LegalEntitiesProfilePage extends StatefulWidget {
  const LegalEntitiesProfilePage({super.key});

  @override
  State<LegalEntitiesProfilePage> createState() =>
      LegalEntitiesProfilePageState();
}

class LegalEntitiesProfilePageState extends State<LegalEntitiesProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox.expand(
          child: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Meu Perfil",
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                        ProfileInfoComponent(),
                        Padding(
                          padding: EdgeInsets.all(11.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Detalhes",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut ali"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(11.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Suas Necessidades",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                        ItemCardComponent(),
                        Padding(
                          padding: EdgeInsets.all(11.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Visitas",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 500,child: Container(child: Gallery(), ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}