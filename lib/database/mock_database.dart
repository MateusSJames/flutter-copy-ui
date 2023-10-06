import 'package:estagio_flutter/models/city.dart';

import '../models/atendimento.dart';

class Database {
  List<City> dates = [
    City(
        id: 1,
        name: "Cidade ADM de MG", 
        bio: "Perfil Oficial da Cidade Administrativa de MG", 
        location: "Cidade Administrativa", 
        adm: "@paulo.oliveira32", 
        moderators1: "@oliverpereiraa",
        moderators2: "@21joaobotelho"
      )
  ];

  List<Atendimento> datesAtendimento = [
    Atendimento(
      id: 1,
      horarios: [
        {
          "Segunda-Feira": "09:00 às 17:00",
          "Terça-Feira": "09:00 às 17:00",
          "Quarta-Feira": "09:00 às 17:00",
          "Quinta-Feira": "09:00 às 17:00",
          "Sexta-Feira": "09:00 às 17:00",
          "Sábado": "Fechado",
          "Domingo": "Fechado",
        },
      ], 
      adm1: "@felipeluizz", 
      adm2: "@ropertapaula20", 
      adm3: "@eumunhozricardo", 
      local: "Cidade ADM de MG", 
      wpp: "+55 15 91234-5678", 
      email: "edificiosul@governomg.com.br"
    )
  ];

  List<City> getCityDates() {
    return List<City>.from(dates);
  }

  List<Atendimento> getAppointmentDates() {
    return List<Atendimento>.from(datesAtendimento);
  }

  void setAppointmentDates(Atendimento ap) {
    int index = datesAtendimento.indexWhere((element) => element.id == ap.id);
    if (index >= 0) {
      datesAtendimento[index] = ap;
    }
  }

  void setCityDates(City city) {
    int index = dates.indexWhere((element) => element.id == city.id);
    if (index >= 0) {
      dates[index] = city;
    }
  }
}