import 'package:estagio_flutter/screens/home/components/cards/cards.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Page1Component extends StatelessWidget {
  const Page1Component({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
                    children: [
                      const CardsPage(
                        description: "Lorem ipsum dolor sit amet consectetur. Nec scelerisque tristique dictumst sed. Sit etiam.", 
                        title: "Cidade ADM de MG",
                        color: Color(0xFFFFB800),
                      ),
                      SizedBox(height: 2.vmax,),
                      const CardsPage(
                        description: "Lorem ipsum dolor sit amet consectetur.", 
                        title: "Cidade ADM de MG",
                        color: Color(0xFFFFB800),
                      ),
                      SizedBox(height: 2.vmax,),
                      const CardsPage(
                        description: "Lorem ipsum dolor sit amet consectetur. Nec scelerisque tristique dictumst sed. Sit etiam.", 
                        title: "Cidade ADM de MG",
                        color: Color(0xFFFFB800),
                      ),
                      SizedBox(height: 2.vmax,),
                      const CardsPage(
                        description: "Lorem ipsum dolor sit amet consectetur. Nec scelerisque tristique dictumst sed. Sit etiam.", 
                        title: "Cidade ADM de MG",
                        color: Color(0xFFFFB800),
                      ),
                    ],
                  );
  }
}