import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

// void main() {
//   runApp(const PattayaBeachHouseApp());
// }

class PattayaBeachHouseApp extends StatelessWidget {
  const PattayaBeachHouseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pattaya Beach House Health Massage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF008080),
        scaffoldBackgroundColor: const Color(0xFFF5F5DC),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: const [
                HeroSection(),
                SizedBox(height: 80),
                ServicesSection(),
                SizedBox(height: 80),
                AboutSection(),
                SizedBox(height: 60),
                FooterSection(),
              ],
            ),
          ),
          const NavBar(),
        ],
      ),
    );
  }
}

// Navigation Bar with Glassmorphism
class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;
        
        return Container(
          height: 80,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.1),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: isMobile ? _buildMobileNav(context) : _buildDesktopNav(context),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileNav(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(),
        IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF008080)),
          onPressed: () {
            // Implement drawer
          },
        ),
      ],
    );
  }

  Widget _buildDesktopNav(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(),
        Row(
          children: [
            _buildNavLink('Home'),
            _buildNavLink('Services'),
            _buildNavLink('About'),
            _buildNavLink('Contact'),
          ],
        ),
        _buildBookButton(),
      ],
    );
  }

  Widget _buildLogo() {
    return Row(
      children: [
        const Icon(Icons.spa, color: Color(0xFF008080), size: 32),
        const SizedBox(width: 8),
        Text(
          'Beach House',
          style: GoogleFonts.playfairDisplay(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF008080),
          ),
        ),
      ],
    );
  }

  Widget _buildNavLink(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: const Color(0xFF333333),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildBookButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF008080),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 0,
      ),
      child: Text(
        'Book Now',
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// Hero Section
class HeroSection extends StatelessWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const NetworkImage(
            'https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=1920',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Rejuvenate Your Body & Soul',
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 56,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Premium Health Massage in Pattaya',
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.white.withOpacity(0.9),
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF008080),
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                elevation: 8,
              ),
              child: Text(
                'Book Appointment',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Services Section
class ServicesSection extends StatelessWidget {
  const ServicesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Text(
            'Our Services',
            style: GoogleFonts.playfairDisplay(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF008080),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Experience the best wellness treatments',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: const Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 900) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ServiceCard(
                      title: 'Thai Massage',
                      price: '฿800',
                      image: 'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?w=600',
                    ),
                    const SizedBox(width: 24),
                    ServiceCard(
                      title: 'Aroma Oil',
                      price: '฿1,200',
                      image: 'https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=600',
                    ),
                    const SizedBox(width: 24),
                    ServiceCard(
                      title: 'Foot Reflexology',
                      price: '฿600',
                      image: 'https://images.unsplash.com/photo-1507652313519-d4e9174996dd?w=600',
                    ),
                  ],
                );
              } else {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ServiceCard(
                        title: 'Thai Massage',
                        price: '฿800',
                        image: 'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?w=600',
                      ),
                      const SizedBox(width: 16),
                      ServiceCard(
                        title: 'Aroma Oil',
                        price: '฿1,200',
                        image: 'https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=600',
                      ),
                      const SizedBox(width: 16),
                      ServiceCard(
                        title: 'Foot Reflexology',
                        price: '฿600',
                        image: 'https://images.unsplash.com/photo-1507652313519-d4e9174996dd?w=600',
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  const ServiceCard({
    Key? key,
    required this.title,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 420,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            child: Image.network(
              image,
              height: 240,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: const Color(0xFF008080),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF008080),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Book',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// About Section
class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 900;
        
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
        );
      },
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildTextContent(),
        const SizedBox(height: 32),
        _buildImage(),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Expanded(child: _buildTextContent()),
        const SizedBox(width: 60),
        Expanded(child: _buildImage()),
      ],
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Us',
          style: GoogleFonts.playfairDisplay(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF008080),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Welcome to Pattaya Beach House Health Massage, where tradition meets tranquility. For over 15 years, we have been providing authentic Thai massage and wellness treatments to locals and travelers seeking rejuvenation.',
          style: GoogleFonts.poppins(
            fontSize: 16,
            height: 1.8,
            color: const Color(0xFF666666),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Our experienced therapists use time-honored techniques combined with modern wellness practices to help you achieve complete relaxation and healing. Located steps from the beautiful Pattaya Beach, we offer a serene escape from the everyday.',
          style: GoogleFonts.poppins(
            fontSize: 16,
            height: 1.8,
            color: const Color(0xFF666666),
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Image.network(
        'https://images.unsplash.com/photo-1600334129128-685c5582fd35?w=800',
        height: 400,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

// Footer Section
class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: const Color(0xFF008080),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 700;
          
          return Column(
            children: [
              isMobile ? _buildMobileFooter() : _buildDesktopFooter(),
              const SizedBox(height: 32),
              const Divider(color: Colors.white24),
              const SizedBox(height: 16),
              Text(
                '© 2024 Pattaya Beach House Health Massage. All rights reserved.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMobileFooter() {
    return Column(
      children: [
        _buildContactInfo(),
        const SizedBox(height: 32),
        _buildSocialLinks(),
      ],
    );
  }

  Widget _buildDesktopFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactInfo(),
        _buildSocialLinks(),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Us',
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Icon(Icons.location_on, color: Colors.white70, size: 20),
            const SizedBox(width: 8),
            Text(
              '123 Beach Road, Pattaya, Thailand',
              style: GoogleFonts.poppins(color: Colors.white70),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.white70, size: 20),
            const SizedBox(width: 8),
            Text(
              '+66 123 456 789',
              style: GoogleFonts.poppins(color: Colors.white70),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.email, color: Colors.white70, size: 20),
            const SizedBox(width: 8),
            Text(
              'info@beachhousemassage.com',
              style: GoogleFonts.poppins(color: Colors.white70),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Follow Us',
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildSocialIcon(Icons.facebook),
            const SizedBox(width: 16),
            _buildSocialIcon(Icons.photo_camera),
            const SizedBox(width: 16),
            _buildSocialIcon(Icons.language),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: Colors.white, size: 24),
    );
  }
}