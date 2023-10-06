import 'package:estagio_flutter/database/mock_database.dart';
import 'package:estagio_flutter/models/city.dart';
import 'package:estagio_flutter/routes/routes.dart';
import 'package:estagio_flutter/screens/components/toast.dart';
import 'package:estagio_flutter/screens/home/landing_page.dart';
import 'package:estagio_flutter/screens/profile/components/fields.dart';
import 'package:estagio_flutter/screens/profile/components/image_profile.dart';
import 'package:estagio_flutter/screens/profile/components/moderators.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

final Database dates = Database();
List<City> cityDates = [];

final _nomeController = TextEditingController();
final _bioController = TextEditingController();
final _admController = TextEditingController();
final _localController = TextEditingController();
final _controllermd1 = TextEditingController();
final _controllermd2= TextEditingController();
final _toastEmitter = ToastEmitter();

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    setState(() {
      cityDates = dates.getCityDates();  
    });
    _nomeController.text = cityDates[0].name;
    _bioController.text = cityDates[0].bio;
    _admController.text = cityDates[0].adm;
    _localController.text = cityDates[0].location;
    _controllermd1.text = cityDates[0].moderators1;
    _controllermd2.text = cityDates[0].moderators2;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Editar perfil",
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
              City city = City(
                id: cityDates[0].id, 
                name: _nomeController.text, 
                bio: _bioController.text, 
                location: _localController.text, 
                adm: _admController.text,
                moderators1: _controllermd1.text,
                moderators2: _controllermd2.text,
              );
              dates.setCityDates(city);
              cityDates = dates.getCityDates();
              await _toastEmitter.success(
                description: 'Cadastro editado com sucesso',
                context: context,
                onClose: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(cities: cityDates, atendimentos: [],),
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
              children: [
                ProfilePhoto(),
                ProfileField(label: "Nome", controller: _nomeController),
                ProfileField(label: "Bio", controller: _bioController),
                ProfileField(label: "Localização", controller: _localController),
                ProfileField(label: "Administrador geral", controller: _admController),
                ModeratorsField(controllermd1: _controllermd1, controllermd2: _controllermd2)
              ],
            ),
          ),
        ),
      ),
    );
  }
}