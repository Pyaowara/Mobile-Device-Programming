import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/ferrari-logo-icon.png', height: 32),

              Image.asset('assets/ferrari-logo.png', height: 84),

              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_outline,
                ),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              ),
            ],
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/ferrari-296-gt3.jpg',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/ferrari-296-gt3-logo.png',
                    width: 240,
                    fit: BoxFit.cover,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\"Fun to race. Fun to win.\"",
                      style: GoogleFonts.goldman(
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "The Ferrari 296 GT3 represents the future of the Prancing Horse in GT racing, a sector that has always seen the closest relationship with customers and the greatest transfer of technology and innovative solutions to production cars.",
                      style: TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          // First column
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "2.9 sec",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  Text(
                                    "0-100 km/h",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 95, 95, 95),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const VerticalDivider(
                            thickness: 2,
                            color: Colors.grey,
                          ),

                          // Second column
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(1),
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "+280km/h",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  Text(
                                    "Top Speed",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 95, 95, 95),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const VerticalDivider(
                            thickness: 2,
                            color: Colors.grey,
                          ),

                          // Third column
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "600hp",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  Text(
                                    "Power",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 95, 95, 95),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(24),
                width: double.infinity,
                height: 300,
                color: const Color.fromARGB(255, 29, 29, 29),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "FUN TO RACE.",
                      style: GoogleFonts.goldman(
                        textStyle: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      "The Ferrari 296 GT3 is a versatile car, developed with the needs of gentleman drivers in mind, both those who aim to win and those who relish racing on the track.",
                    ),
                  ],
                ),
              ),

              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Image.asset(
                    'assets/ferrari-296-gt3-side.jpg',
                    width: double.infinity,
                    height: 800,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "DESIGN",
                          style: GoogleFonts.goldman(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              height: 1.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.red,
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          "BEAUTY AT THE SERVICE OF PERFORMANCE",
                          style: GoogleFonts.goldman(
                            textStyle: const TextStyle(
                              fontSize: 36,
                              height: 1.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          "Ferrari's future in GT racing is sinuous in form, enfolding the volumes of the 296 GTB, redefining them to meet the requirements of the track and performance.",
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Image.asset(
                    'assets/ferrari-296-gt3-engine.jpg',
                    width: double.infinity,
                    height: 800,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ENGINE",
                          style: GoogleFonts.goldman(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              height: 1.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.red,
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          "RETURN TO THE SIX-CYLINDER",
                          style: GoogleFonts.goldman(
                            textStyle: const TextStyle(
                              fontSize: 40,
                              height: 1.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Image.asset(
                    'assets/ferrari-296-gt3-safety.jpg',
                    width: double.infinity,
                    height: 800,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SAFETY & RELIABILITY",
                          style: GoogleFonts.goldman(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              height: 1.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.red,
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          "LEADING THE WAY IN SAFETY",
                          style: GoogleFonts.goldman(
                            textStyle: const TextStyle(
                              fontSize: 40,
                              height: 1.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          "In GT racing, the cars have to meet increasingly stringent safety standards. The 296 GT3 has been designed and built to the FIA's highest protection levels. ",
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Container(
                padding: const EdgeInsets.all(24),
                width: double.infinity,
                height: 300,
                color: const Color.fromARGB(255, 29, 29, 29),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "FUN TO WIN.",
                      style: GoogleFonts.goldman(
                        textStyle: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      "The Ferrari 296 GT3 aims to surpass the astonishing numbers achieved by the 488 GT3, drawing on the expertise of the Ferrari Competizioni GT team and the innovative solutions that the car provides.",
                    ),
                  ],
                ),
              ),

              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Image.asset(
                    'assets/ferrari-296-gt3-aerodynamics.jpg',
                    width: double.infinity,
                    height: 800,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "AERODYNAMICS",
                          style: GoogleFonts.goldman(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              height: 1.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.red,
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          "AN EXTRAORDINARY BALANCE",
                          style: GoogleFonts.goldman(
                            textStyle: const TextStyle(
                              fontSize: 30,
                              height: 1.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Image.asset(
                    'assets/ferrari-296-gt3-trackops.jpg',
                    width: double.infinity,
                    height: 800,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TRACK OPERATIONS",
                          style: GoogleFonts.goldman(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              height: 1.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.red,
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          "INSTANT INTERVENTIONS",
                          style: GoogleFonts.goldman(
                            textStyle: const TextStyle(
                              fontSize: 38,
                              height: 1.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          "In designing the 296 GT3, Ferrari's engineers focused on speeding up track operations on the car during the race and pre-race. ",
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Container(
                padding: const EdgeInsets.all(24),
                width: double.infinity,
                height: 300,
                color: const Color.fromARGB(255, 29, 29, 29),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TECHNICAL SPECIFICATIONS",
                      style: GoogleFonts.goldman(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          height: 1.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 28,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio:
                          2.6, // tweak for your preferred proportions
                      children: [
                        _buildSpecItem('V6', 'ENGINE'),
                        _buildSpecItem('600 Hp', 'MAXIMUM POWER'),
                        _buildSpecItem('712 Nm', 'MAXIMUM TORQUE'),
                        _buildSpecItem('2992 cc', 'TOTAL DISPLACEMENT'),
                      ],
                    ),
                  ],
                ),
              ),

              Image.asset(
                'assets/sponsors.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpecItem(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: GoogleFonts.goldman(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
              height: 1.0,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              color: Colors.white54,
              fontSize: 12,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ],
    );
  }
}
