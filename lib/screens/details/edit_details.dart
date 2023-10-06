import 'package:estagio_flutter/database/mock_database.dart';
import 'package:estagio_flutter/models/atendimento.dart';
import 'package:estagio_flutter/routes/routes.dart';
import 'package:estagio_flutter/screens/details/components/dates.dart';
import 'package:estagio_flutter/screens/details/components/fields.dart';
import 'package:estagio_flutter/screens/details/components/job_card.dart';
import 'package:estagio_flutter/screens/details/components/jobs.dart';
import 'package:estagio_flutter/screens/home/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../components/toast.dart';

class EditDetailsPage extends StatefulWidget {
  const EditDetailsPage({super.key});

  @override
  State<EditDetailsPage> createState() => _EditDetailsPageState();
}

final _toastEmitter = ToastEmitter();
final Database dates = Database();
List<Atendimento> appointmentDates = [];

final _localController = TextEditingController();
final _wppController = TextEditingController();
final _emailController = TextEditingController();
List<TextEditingController> _dateControllers = List.generate(12, (_) => TextEditingController());


class _EditDetailsPageState extends State<EditDetailsPage> {
  
  @override
  void initState() {
    setState(() {
      appointmentDates = dates.getAppointmentDates();  
    });
    _localController.text = appointmentDates[0].local;
    _wppController.text = appointmentDates[0].wpp;
    _emailController.text = appointmentDates[0].email;
    _dateControllers[0].text = appointmentDates[0].horarios[0]["Segunda-Feira"].split(" às ")[0];
    _dateControllers[1].text = appointmentDates[0].horarios[0]["Segunda-Feira"].split(" às ")[1];
    _dateControllers[2].text = appointmentDates[0].horarios[0]["Terça-Feira"].split(" às ")[0];
    _dateControllers[3].text = appointmentDates[0].horarios[0]["Terça-Feira"].split(" às ")[1];
    _dateControllers[4].text = appointmentDates[0].horarios[0]["Quarta-Feira"].split(" às ")[0];
    _dateControllers[5].text = appointmentDates[0].horarios[0]["Quarta-Feira"].split(" às ")[1];
    _dateControllers[6].text = appointmentDates[0].horarios[0]["Quinta-Feira"].split(" às ")[0];
    _dateControllers[7].text = appointmentDates[0].horarios[0]["Quinta-Feira"].split(" às ")[1];
    _dateControllers[8].text = appointmentDates[0].horarios[0]["Sexta-Feira"].split(" às ")[0];
    _dateControllers[9].text = appointmentDates[0].horarios[0]["Sexta-Feira"].split(" às ")[1];
    _dateControllers[10].text = appointmentDates[0].horarios[0]["Sábado"];
    _dateControllers[11].text = appointmentDates[0].horarios[0]["Domingo"];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Editar sobre",
          style: GoogleFonts.getFont(
          'Open Sans',
          textStyle: TextStyle(
              color: Colors.black,
              fontSize: 2.vmax,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () async {
              Atendimento app = Atendimento(
                id: appointmentDates[0].id, 
                horarios: [
                  {
                    "Segunda-Feira": "${_dateControllers[0].text} às ${_dateControllers[1].text}",
                    "Terça-Feira": "${_dateControllers[2].text} às ${_dateControllers[3].text}",
                    "Quarta-Feira": "${_dateControllers[4].text} às ${_dateControllers[5].text}",
                    "Quinta-Feira": "${_dateControllers[6].text} às ${_dateControllers[7].text}",
                    "Sexta-Feira": "${_dateControllers[8].text} às ${_dateControllers[9].text}",
                    "Sábado": "Fechado",
                    "Domingo": "Fechado"
                  },
                ], 
                adm1: appointmentDates[0].adm1, 
                adm2: appointmentDates[0].adm2, 
                adm3: appointmentDates[0].adm3, 
                local: _localController.text, 
                wpp: _wppController.text, 
                email: _emailController.text
              );
              dates.setAppointmentDates(app);
              appointmentDates = dates.getAppointmentDates();
              await _toastEmitter.success(
                description: 'Cadastro editado com sucesso',
                context: context,
                onClose: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(cities: [], atendimentos: appointmentDates,),
                          ),
                        );
                }
              );
            }, 
            child: Text(
              "Salvar",
              style: GoogleFonts.getFont(
              'Open Sans',
              textStyle: TextStyle(
                  color: const Color(0xFF4E97FE),
                  fontSize: 2.vmax,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
        leading: 
          IconButton(
            onPressed: (){
              Navigator.of(context).pushNamedAndRemoveUntil(Routes.home, (route) => false);
            }, 
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xFF4E97FE),
            )
          )
      ),
      body: Container(
        width: 100.w,
        height: 100.h,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.vmax),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.4.vmax),
                  child: Text(
                        "Horário de atendimento",
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
                DetailsDates(day: "Segunda-feira", controllerInitHour: _dateControllers[0], controllerEndHour: _dateControllers[1],),
                DetailsDates(day: "Terça-feira", controllerInitHour: _dateControllers[2], controllerEndHour: _dateControllers[3],),
                DetailsDates(day: "Quarta-feira", controllerInitHour: _dateControllers[4], controllerEndHour: _dateControllers[5],),
                DetailsDates(day: "Quinta-feira", controllerInitHour: _dateControllers[6], controllerEndHour: _dateControllers[7],),
                DetailsDates(day: "Sexta-feira", controllerInitHour: _dateControllers[8], controllerEndHour: _dateControllers[9],),
                DetailsDatesFds(day: "Sábado", controllerInitHour: _dateControllers[10]),
                DetailsDatesFds(day: "Domingo", controllerInitHour: _dateControllers[11]),
                const JobsField(),
                JobCards(title: "Edifício Sul", adm: appointmentDates[0].adm1),
                JobCards(title: "Edifício Sul", adm: appointmentDates[0].adm2),
                JobCards(title: "Edifício Sul", adm: appointmentDates[0].adm3),
                DetailsField(label: "Localização", controller: _localController),
                DetailsField(label: "Whatsapp", controller: _wppController),
                DetailsField(label: "E-mail", controller: _emailController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}