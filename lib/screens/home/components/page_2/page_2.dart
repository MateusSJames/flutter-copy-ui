import 'package:estagio_flutter/models/atendimento.dart';
import 'package:estagio_flutter/routes/routes.dart';
import 'package:estagio_flutter/screens/components/edit_button.dart';
import 'package:estagio_flutter/screens/home/components/cards/cards_page2.dart';
import 'package:estagio_flutter/screens/home/components/page_2/section_contact.dart';
import 'package:estagio_flutter/screens/home/components/page_2/section_map.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Page2Component extends StatefulWidget {
  final List<Atendimento> atendimentos;
  const Page2Component({super.key, required this.atendimentos});

  @override
  State<Page2Component> createState() => _Page2ComponentState();
}

class _Page2ComponentState extends State<Page2Component> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.vmax),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Button(
            onPressed: (){
              Navigator.of(context).pushNamedAndRemoveUntil(Routes.details, (route) => false);
            }, 
            title: "Editar seção sobre", 
            height: 0.5.h, 
            width: 10.w, 
            fontSize: 1.8
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2.vmax),
            child: Text(
              "Horário de Atendimento",
              style: GoogleFonts.getFont(
                                'Open Sans',
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 1.7.vmax,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
            ),
          ),
          Column(
            children: widget.atendimentos.map((e) {
              // Verifica se e.horarios[0] não é nulo e se é um mapa
              if (e.horarios.isNotEmpty) {
                Map<String, dynamic> primeiroHorario = e.horarios[0];
                List<Widget> textWidgets = [];
                List<Widget> textHoursWidgets = [];

                // Itera por todas as chaves e cria um widget Text para cada uma
                for (var chave in primeiroHorario.keys) {
                  textWidgets.add(
                    Text(
                      "${chave}", // Combina chave e valor
                      style: GoogleFonts.getFont(
                        'Open Sans',
                        textStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 1.7.vmax,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                  textHoursWidgets.add(
                    Text(
                      "${primeiroHorario[chave]}", // Combina chave e valor
                      style: GoogleFonts.getFont(
                        'Open Sans',
                        textStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 1.7.vmax,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: textWidgets,
                    ),
                    Divider(color: Colors.grey, height: 1.vmax),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: textHoursWidgets,
                    ),
                  ],
                );
              } else {
                return Text('Dados inválidos');
              }
            }).toList(),
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 2.vmax),
            child: Text(
              "Edifícios",
              style: GoogleFonts.getFont(
                                'Open Sans',
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 1.7.vmax,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
            ),
          ),
          const CardsPage2(
            description: "Edifício da Cidade Administrativa de MG", 
            title: "Edifício Sul", 
            color: Color(0xFF7A5CF0), 
            adm: "@edificiosul",
          ),
          const CardsPage2(
            description: "Edifício da Cidade Administrativa de MG", 
            title: "Edifício Norte", 
            color: Color(0xFF7A5CF0), 
            adm: "@edificionorte"
          ),
          const CardsPage2(
            description: "Edifício da Cidade Administrativa de MG", 
            title: "Edifício Central", 
            color: Color(0xFF7A5CF0),
            adm: "@edificiocentral"
          ),
          const SectionMap(),
          SectionContact(mail: widget.atendimentos[0].email, wpp: widget.atendimentos[0].wpp,),
        ],
      ),
    );
  }
}