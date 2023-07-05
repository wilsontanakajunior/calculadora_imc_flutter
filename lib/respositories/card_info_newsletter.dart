import 'package:calculadora_imc/models/info_newsletter_model.dart';

class CardInfoNewlettersRepositories {
  CardInfoNewlettersRepositories(InfoNewsLetterModel? infoNewsLetterModel);

  static Future<List<InfoNewsLetterModel>> get() async {
    return [
      InfoNewsLetterModel(
        imgUrl: "assets/images/balanca.png",
        msgTitle: "Um pouco sobre imc",
        msgBody:
            "O Índice de Massa Corporal (IMC) é uma medida que relaciona o peso e a altura de uma pessoa, sendo amplamente utilizada para avaliar se uma pessoa está com peso adequado, abaixo do peso, acima do peso ou obesa. O Índice de Massa Corporal (IMC) é uma medida que relaciona o peso e a altura de uma pessoa, sendo amplamente utilizada para avaliar se uma pessoa está com peso adequado, abaixo do peso, acima do peso ou obesa",
      ),
      InfoNewsLetterModel(
        imgUrl: "assets/images/balanca.png",
        msgTitle: "Nutrição e dietas saudáveis",
        msgBody:
            "Informações sobre alimentação equilibrada, dietas específicas (como vegetariana, vegana, low carb, etc.), dicas de nutrição e receitas saudáveis.",
      ),
      InfoNewsLetterModel(
        imgUrl: "assets/images/balanca.png",
        msgTitle: "Exercícios e atividades físicas",
        msgBody:
            "Artigos sobre os benefícios do exercício físico, diferentes tipos de atividades (como musculação, corrida, yoga, dança, etc.), dicas de treinamento e rotinas de exercícios.",
      ),
      InfoNewsLetterModel(
        imgUrl: "assets/images/balanca.png",
        msgTitle: "Saúde mental e bem-estar emocional",
        msgBody:
            "Notícias sobre saúde mental, estratégias de gerenciamento do estresse, técnicas de relaxamento, meditação, autoestima e autoaceitação.",
      ),
      InfoNewsLetterModel(
        imgUrl: "assets/images/balanca.png",
        msgTitle: "Doenças e condições de saúde",
        msgBody:
            " Informações sobre doenças comuns, como diabetes, hipertensão, colesterol alto, alergias, gripes e resfriados, além de dicas de prevenção e tratamentos.",
      ),
    ];
  }
}
