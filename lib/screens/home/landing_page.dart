import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:estagio_flutter/database/mock_database.dart';
import 'package:estagio_flutter/models/atendimento.dart';
import 'package:estagio_flutter/models/city.dart';
import 'package:estagio_flutter/routes/routes.dart';
import 'package:estagio_flutter/screens/components/edit_button.dart';
import 'package:estagio_flutter/screens/home/components/bottom_bar.dart';
import 'package:estagio_flutter/screens/home/components/page_1/page_1.dart';
import 'package:estagio_flutter/screens/home/components/page_2/page_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  List<City> cities;
  List<Atendimento> atendimentos;
  HomePage({super.key, required this.cities, required this.atendimentos});

  @override
  State<HomePage> createState() => _HomePageState();
}
final Database dates = Database();
List<City> cityDates = [];
int selectedPage = 0;

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController(initialPage: 0);
    if(widget.cities.isEmpty) {
      setState(() {
        widget.cities = dates.getCityDates();
      });
    }
    if(widget.atendimentos.isEmpty) {
      setState(() {
        widget.atendimentos = dates.getAppointmentDates();
      });
    }
    super.initState();
  }

  void _onTabTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 100.w,
              height: 30.h,
              child: Image.asset(
                "assets/landing_image.png",
                fit: BoxFit.cover
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2.vmax),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      onPressed: (){
                        Navigator.of(context).pushNamedAndRemoveUntil(Routes.profile, (route) => false);
                      }, 
                      title: "Editar perfil",
                      width: 10.w,
                      height: 0.5.h,
                      fontSize: 2,
                    )
                  ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2.vmax),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.2.vmax),
                    child: Row(
                      children: [
                        Text(
                          widget.cities[0].name,
                          style: GoogleFonts.getFont(
                              'Open Sans',
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 3.vmax,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                        ),
                        Icon(Icons.verified, color: const Color(0xFFFFB800), size: 2.5.vmax,),
                      ],
                    ),
                  ),
                  Text(
                    widget.cities[0].bio,
                    style: GoogleFonts.getFont(
                        'Open Sans',
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 1.7.vmax,
                          fontWeight: FontWeight.normal,
                        ),
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey,
                            size: 3.5.vmax,
                          ),
                          Text(
                            widget.cities[0].location,
                            style: GoogleFonts.getFont(
                                'Open Sans',
                                textStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 1.5.vmax,
                                  fontWeight: FontWeight.normal,
                                ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.vmax),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_city,
                              color: Colors.grey,
                              size: 3.5.vmax,
                            ),
                            Text(
                              "Entrou em jan/23",
                              style: GoogleFonts.getFont(
                                  'Open Sans',
                                  textStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 1.5.vmax,
                                    fontWeight: FontWeight.normal,
                                  ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TabBar(
              controller: _tabController,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              tabs: [
                GestureDetector(
                  onTap: () {
                    _onTabTapped(0);
                  },
                  child: const Tab(
                    text: "Atividades",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _onTabTapped(1);
                  },
                  child: const Tab(
                    text: "Sobre",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _onTabTapped(2);
                  },
                  child: const Tab(
                    text: "Avisos e Comunicados",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100.h,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  _tabController.animateTo(index); // Sincronize a TabBar com o PageView
                },
                children: [
                  const Page1Component(),
                  Page2Component(atendimentos: widget.atendimentos,),
                  // Conteúdo da Aba 3
                  const Center(child: Text('Conteúdo da Aba 3')),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}