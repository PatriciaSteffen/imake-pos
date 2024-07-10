import 'package:flutter/material.dart';
import 'package:imake/components/custom_app_bar.dart';
import 'package:imake/utils/color_palette.dart';

import '../../../components/widgets.dart';
import '../../../utils/font_sizes.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        child: Scaffold(
            backgroundColor: kWhiteColor,
            appBar: const CustomAppBar(
              title: 'Sobre os Desenvolvedores',
              showBackArrow: true,
              backgroundColor: kPrimaryColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildText(
                      'Atividade prática utilizando o projeto IMAKE em Flutter',
                      kBlackColor,
                      textExtraLarge,
                      FontWeight.w600,
                      TextAlign.center,
                      TextOverflow.clip),
                  const SizedBox(
                    height: 20,
                  ),
                  buildText(
                      'Pós-Graduação em Desenvolvimento Web e Mobile',
                      kBlackColor,
                      textMedium,
                      FontWeight.normal,
                      TextAlign.start,
                      TextOverflow.clip),
                  const SizedBox(
                    height: 5,
                  ),
                  buildRichText('Componente Curricular', 'Desenvolvimento Web',
                      kBlackColor, textMedium, TextOverflow.clip),
                  const SizedBox(
                    height: 5,
                  ),
                  buildRichText('Professor', 'Roberson Junior Fernandes Alves',
                      kBlackColor, textMedium, TextOverflow.clip),
                  const SizedBox(
                    height: 5,
                  ),
                  buildRichText('Acadêmica', 'Patrícia Steffen', kBlackColor,
                      textMedium, TextOverflow.clip),
                ],
              ),
            )));
  }
}
