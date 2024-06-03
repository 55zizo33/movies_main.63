import 'package:flutter/material.dart';
import 'package:project/design/app_image.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  final list =["Welcome to Tranquility – your personal assistant in the digital world. At Tranquility, we believe that everyone deserves a moment of peace and calm amidst the chaos of everyday life. Our mission is to provide"
      " a sanctuary where you can unwind, destress, and find solace through meaningful conversations with our AI chatbot.",
    "In today's fast-paced world, it's easy to feel overwhelmed and anxious. That's why we've created Tranquility – to offer you a refuge where you can freely express yourself "
        "without fear of judgment or interruption. Whether you're seeking advice, a listening ear, or simply some company, our AI chatbot is here to support you every step of the way.",
    "Our team is passionate about mental well-being and technology, and we're dedicated to harnessing the power of AI to promote relaxation and mindfulness. With Tranquility, you can embark on a journey"
        " of self-discovery, self-care, and self-improvement, all from the comfort of your smartphone.",
    "So why wait? Take a deep breath, download Tranquility, and let our AI chatbot guide you on your path to inner peace and tranquility. Together, we can create a brighter, calmer future – one conversation at a time.",

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("About Us") ,
      ),
      body: ListView(
        children: [
          APPImage("About Us",height: 238,width: 238),
          SizedBox(height: 24,),
          Text("Welcome to Tranquility where relaxation meets innovation",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 16),
          ...List.generate( list.length,
             (index) => Padding(
               padding: const EdgeInsets.only(bottom: 16),
               child: Text(list[index],style: TextStyle(
                 fontSize: 16
               ),),
             )
    )
        ],
      ),
    );
  }
}
