// lib/screens/onboarding/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'onboarding_content.dart';
import '../auth/login_screen.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/logo_tokas.png",
      "title": "Selamat Datang di TOKAS",
      "description": "Temukan kebutuhan harianmu dengan cepat dan mudah.",
    },
    {
      "image": "assets/images/berkualitas.png",
      "title": "Belanja Barang Bekas Berkualitas",
      "description": "Dapatkan barang bekas berkualitas dengan harga terjangkau.",
    },
    {
      "image": "assets/images/komunitas.png",
      "title": "Bergabunglah dengan Komunitas Kami",
      "description": "Jadilah bagian dari komunitas TOKAS dan nikmati penawaran menarik.",
    },
    {
      "image": "assets/images/mulaibelanja.png",
      "title": "Mulai Berbelanja Sekarang",
      "description": "Ayo, mulai berbelanja dan temukan barang impianmu!",
    },  
  ];

void _goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => setState(() {
                  currentIndex = index;
                }),
                itemCount: onboardingData.length,
                itemBuilder: (context, index) => OnboardingContent(
                  image: onboardingData[index]["image"]!,
                  title: onboardingData[index]["title"]!,
                  description: onboardingData[index]["description"]!,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => buildDot(index),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (currentIndex == onboardingData.length - 1) {
                    _goToLogin();
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                },
                child: Text(
                  currentIndex == onboardingData.length - 1
                      ? "Get Started"
                      : "Next",
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            TextButton(
              onPressed: _goToLogin,
              child: const Text("Skip"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: currentIndex == index ? 24 : 8,
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.green : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
