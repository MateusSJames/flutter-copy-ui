class Atendimento {

  final List<Map<String, dynamic>> horarios;
  final int id;
  final String adm1;
  final String adm2;
  final String adm3;
  final String local;
  final String wpp;
  final String email;
  
  Atendimento({
    required this.id,
    required this.horarios,
    required this.adm1,
    required this.adm2,
    required this.adm3,
    required this.local,
    required this.wpp,
    required this.email
  });
}