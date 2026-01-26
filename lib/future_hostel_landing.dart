import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

// void main() {
//   runApp(const FutureHostelApp());
// }

class FutureHostelApp extends StatelessWidget {
  const FutureHostelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Hostel Pattaya',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF2D5A8C),
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _roomsKey = GlobalKey();
  final GlobalKey _facilitiesKey = GlobalKey();
  final GlobalKey _galleryKey = GlobalKey();
  final GlobalKey _locationKey = GlobalKey();
  final GlobalKey _reviewsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(key: _homeKey),
                AboutSection(),
                RoomsSection(key: _roomsKey),
                FacilitiesSection(key: _facilitiesKey),
                ServicesSection(),
                GallerySection(key: _galleryKey),
                LocationSection(key: _locationKey),
                ReviewsSection(key: _reviewsKey),
                ContactSection(key: _contactKey),
                const FooterSection(),
              ],
            ),
          ),
          AnimatedNavBar(
            onHomePressed: () => _scrollToSection(_homeKey),
            onRoomsPressed: () => _scrollToSection(_roomsKey),
            onFacilitiesPressed: () => _scrollToSection(_facilitiesKey),
            onGalleryPressed: () => _scrollToSection(_galleryKey),
            onLocationPressed: () => _scrollToSection(_locationKey),
            onReviewsPressed: () => _scrollToSection(_reviewsKey),
            onContactPressed: () => _scrollToSection(_contactKey),
          ),
        ],
      ),
    );
  }
}

// Animated Navigation Bar
class AnimatedNavBar extends StatefulWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onRoomsPressed;
  final VoidCallback onFacilitiesPressed;
  final VoidCallback onGalleryPressed;
  final VoidCallback onLocationPressed;
  final VoidCallback onReviewsPressed;
  final VoidCallback onContactPressed;

  const AnimatedNavBar({
    Key? key,
    required this.onHomePressed,
    required this.onRoomsPressed,
    required this.onFacilitiesPressed,
    required this.onGalleryPressed,
    required this.onLocationPressed,
    required this.onReviewsPressed,
    required this.onContactPressed,
  }) : super(key: key);

  @override
  State<AnimatedNavBar> createState() => _AnimatedNavBarState();
}

class _AnimatedNavBarState extends State<AnimatedNavBar> {
  bool _isScrolled = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        setState(() {
          _isScrolled = notification.metrics.pixels > 50;
        });
        return true;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: isMobile ? 70 : 80,
        margin: EdgeInsets.all(_isScrolled ? 12 : 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _isScrolled
              ? Colors.white.withOpacity(0.95)
              : Colors.white.withOpacity(0.1),
          border: Border.all(
            color: _isScrolled
                ? Colors.grey.withOpacity(0.2)
                : Colors.white.withOpacity(0.3),
          ),
          boxShadow: _isScrolled
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 5),
                  )
                ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 32),
              child: isMobile
                  ? _buildMobileNav(_isScrolled)
                  : _buildDesktopNav(_isScrolled),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileNav(bool isScrolled) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(mobile: true, isScrolled: isScrolled),
        AnimatedButton(
          onPressed: () => _showMobileMenu(),
          child: Icon(
            Icons.menu_rounded,
            color: isScrolled ? const Color(0xFF2D5A8C) : Colors.white,
            size: 28,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopNav(bool isScrolled) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(mobile: false, isScrolled: isScrolled),
        Row(
          children: [
            _buildNavLink('Home', widget.onHomePressed, isScrolled),
            _buildNavLink('Rooms', widget.onRoomsPressed, isScrolled),
            _buildNavLink('Facilities', widget.onFacilitiesPressed, isScrolled),
            _buildNavLink('Gallery', widget.onGalleryPressed, isScrolled),
            _buildNavLink('Location', widget.onLocationPressed, isScrolled),
            _buildNavLink('Reviews', widget.onReviewsPressed, isScrolled),
            _buildNavLink('Contact', widget.onContactPressed, isScrolled),
          ],
        ),
        AnimatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Booking feature coming soon!',
                  style: GoogleFonts.poppins(),
                ),
                backgroundColor: const Color(0xFF2D5A8C),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF2D5A8C),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              'Book Now',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogo({required bool mobile, required bool isScrolled}) {
    return AnimatedButton(
      onPressed: widget.onHomePressed,
      child: Row(
        children: [
          Icon(
            Icons.hotel_rounded,
            color: isScrolled ? const Color(0xFF2D5A8C) : Colors.white,
            size: mobile ? 28 : 36,
          ),
          SizedBox(width: mobile ? 8 : 12),
          Text(
            'Future Hostel',
            style: GoogleFonts.playfairDisplay(
              fontSize: mobile ? 18 : 24,
              fontWeight: FontWeight.bold,
              color: isScrolled ? const Color(0xFF2D5A8C) : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavLink(String text, VoidCallback onPressed, bool isScrolled) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AnimatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: isScrolled ? const Color(0xFF333333) : Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  void _showMobileMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMenuItem('Home', Icons.home, widget.onHomePressed),
            _buildMenuItem('Rooms', Icons.bed, widget.onRoomsPressed),
            _buildMenuItem('Facilities', Icons.spa, widget.onFacilitiesPressed),
            _buildMenuItem('Gallery', Icons.photo_library, widget.onGalleryPressed),
            _buildMenuItem('Location', Icons.location_on, widget.onLocationPressed),
            _buildMenuItem('Reviews', Icons.star, widget.onReviewsPressed),
            _buildMenuItem('Contact', Icons.phone, widget.onContactPressed),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: AnimatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Booking feature coming soon!',
                        style: GoogleFonts.poppins(),
                      ),
                      backgroundColor: const Color(0xFF2D5A8C),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2D5A8C),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Book Now',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String text, IconData icon, VoidCallback onPressed) {
    return AnimatedButton(
      onPressed: () {
        Navigator.pop(context);
        onPressed();
      },
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF2D5A8C)),
        title: Text(
          text,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

// Animated Button Widget
class AnimatedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;

  const AnimatedButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onPressed();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
      ),
    );
  }
}

// Hero Section
class HeroSection extends StatelessWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const NetworkImage(
            'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=1920',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInAnimation(
                delay: 0,
                child: Text(
                  'Future Hostel Pattaya',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: isMobile ? 40 : 72,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              FadeInAnimation(
                delay: 200,
                child: Text(
                  'Your Affordable Adventure Starts Here',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 18 : 24,
                    color: Colors.white.withOpacity(0.95),
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              FadeInAnimation(
                delay: 400,
                child: Text(
                  '141 บุญสัมพันธ์, Nong Prue, Pattaya',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 14 : 18,
                    color: Colors.white.withOpacity(0.85),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              FadeInAnimation(
                delay: 600,
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    AnimatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Redirecting to booking page...',
                              style: GoogleFonts.poppins(),
                            ),
                            backgroundColor: const Color(0xFF2D5A8C),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 32 : 48,
                          vertical: isMobile ? 18 : 24,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2D5A8C),
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Text(
                          'Book Your Stay',
                          style: GoogleFonts.poppins(
                            fontSize: isMobile ? 16 : 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    AnimatedButton(
                      onPressed: () {
                        final galleryKey = (context.findAncestorStateOfType<_LandingPageState>());
                        galleryKey?._scrollToSection(galleryKey._galleryKey);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 32 : 48,
                          vertical: isMobile ? 18 : 24,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Text(
                          'View Gallery',
                          style: GoogleFonts.poppins(
                            fontSize: isMobile ? 16 : 20,
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
        ),
      ),
    );
  }
}

// Fade In Animation Widget
class FadeInAnimation extends StatefulWidget {
  final Widget child;
  final int delay;

  const FadeInAnimation({
    Key? key,
    required this.child,
    this.delay = 0,
  }) : super(key: key);

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}

// About Section
class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      color: const Color(0xFFF8F9FA),
      child: Column(
        children: [
          Text(
            'Welcome to Future Hostel',
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2D5A8C),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Your home away from home in the heart of Pattaya',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 16 : 20,
              color: const Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 48),
          Container(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Text(
              'Located in the vibrant Nong Prue area, Future Hostel Pattaya offers affordable, comfortable accommodation for backpackers and travelers. With air-conditioned rooms, free WiFi, and a welcoming shared lounge, we provide everything you need for an unforgettable stay in Pattaya. Just 2 miles from the train station and close to major attractions like Alcazar Cabaret and Mini Siam.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 15 : 17,
                height: 1.8,
                color: const Color(0xFF555555),
              ),
            ),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _buildFeature(Icons.wifi, 'Free WiFi', isMobile),
              _buildFeature(Icons.ac_unit, 'Air Conditioned', isMobile),
              _buildFeature(Icons.local_airport, 'Airport Transfer', isMobile),
              _buildFeature(Icons.coffee, 'Coffee House', isMobile),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeature(IconData icon, String text, bool isMobile) {
    return Container(
      width: isMobile ? 150 : 200,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: const Color(0xFF2D5A8C)),
          const SizedBox(height: 12),
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF333333),
            ),
          ),
        ],
      ),
    );
  }
}

// Rooms Section
class RoomsSection extends StatelessWidget {
  const RoomsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: [
          Text(
            'Our Rooms',
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2D5A8C),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Comfortable dormitory beds with all amenities',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 18,
              color: const Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 56),
          isMobile ? _buildMobileRooms() : _buildDesktopRooms(),
        ],
      ),
    );
  }

  Widget _buildMobileRooms() {
    return Column(
      children: const [
        RoomCard(
          title: 'Mixed Dormitory',
          image: 'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=600',
          features: ['Shared bathroom', 'Air conditioning', 'Free WiFi', 'Lockers'],
        ),
        SizedBox(height: 24),
        RoomCard(
          title: 'Private Room',
          image: 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=600',
          features: ['City view', 'Terrace', 'Desk', 'Refrigerator'],
        ),
      ],
    );
  }

  Widget _buildDesktopRooms() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        RoomCard(
          title: 'Mixed Dormitory',
          image: 'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=600',
          features: ['Shared bathroom', 'Air conditioning', 'Free WiFi', 'Lockers'],
        ),
        SizedBox(width: 32),
        RoomCard(
          title: 'Private Room',
          image: 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=600',
          features: ['City view', 'Terrace', 'Desk', 'Refrigerator'],
        ),
      ],
    );
  }
}

class RoomCard extends StatefulWidget {
  final String title;
  final String image;
  final List<String> features;

  const RoomCard({
    Key? key,
    required this.title,
    required this.image,
    required this.features,
  }) : super(key: key);

  @override
  State<RoomCard> createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 400,
        transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.15 : 0.08),
              blurRadius: _isHovered ? 30 : 20,
              offset: Offset(0, _isHovered ? 15 : 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              child: Image.network(
                widget.image,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...widget.features.map(
                    (feature) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Color(0xFF2D5A8C),
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            feature,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: const Color(0xFF666666),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: AnimatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Checking availability for ${widget.title}...',
                              style: GoogleFonts.poppins(),
                            ),
                            backgroundColor: const Color(0xFF2D5A8C),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2D5A8C),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Check Availability',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Facilities Section
class FacilitiesSection extends StatelessWidget {
  const FacilitiesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      color: const Color(0xFFF8F9FA),
      child: Column(
        children: [
          Text(
            'Facilities & Amenities',
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2D5A8C),
            ),
          ),
          const SizedBox(height: 56),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _buildFacility(Icons.wifi, 'Free WiFi', isMobile),
              _buildFacility(Icons.ac_unit, 'Air Conditioning', isMobile),
              _buildFacility(Icons.local_laundry_service, 'Laundry', isMobile),
              _buildFacility(Icons.kitchen, 'Shared Kitchen', isMobile),
              _buildFacility(Icons.living, 'Shared Lounge', isMobile),
              _buildFacility(Icons.balcony, 'Terrace', isMobile),
              _buildFacility(Icons.lock, 'Lockers', isMobile),
              _buildFacility(Icons.clean_hands, 'Daily Housekeeping', isMobile),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFacility(IconData icon, String text, bool isMobile) {
    return Container(
      width: isMobile ? 150 : 180,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 36, color: const Color(0xFF2D5A8C)),
          const SizedBox(height: 12),
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF333333),
            ),
          ),
        ],
      ),
    );
  }
}

// Services Section
class ServicesSection extends StatelessWidget {
  const ServicesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: [
          Text(
            'Our Services',
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2D5A8C),
            ),
          ),
          const SizedBox(height: 56),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: const [
              ServiceCard(
                icon: Icons.spa,
                title: 'Massage Services',
                description: 'Full body, foot, neck, and head massage available',
                image: 'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?w=400',
              ),
              ServiceCard(
                icon: Icons.coffee,
                title: 'Coffee House',
                description: 'On-site cafe serving fresh coffee and snacks',
                image: 'https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?w=400',
              ),
              ServiceCard(
                icon: Icons.local_airport,
                title: 'Airport Transfer',
                description: '27 miles from U-Tapao International Airport',
                image: 'https://images.unsplash.com/photo-1464037866556-6812c9d1c72e?w=400',
              ),
              ServiceCard(
                icon: Icons.music_note,
                title: 'Entertainment',
                description: 'Evening entertainment and karaoke nights',
                image: 'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?w=400',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final String image;

  const ServiceCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 280,
        transform: Matrix4.identity()
          ..translate(0.0, _isHovered ? -10.0 : 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.12 : 0.06),
              blurRadius: _isHovered ? 25 : 15,
              offset: Offset(0, _isHovered ? 12 : 8),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                widget.image,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Icon(widget.icon, size: 40, color: const Color(0xFF2D5A8C)),
                  const SizedBox(height: 16),
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.description,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      height: 1.6,
                      color: const Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Enhanced Gallery Section
class GallerySection extends StatefulWidget {
  const GallerySection({Key? key}) : super(key: key);

  @override
  State<GallerySection> createState() => _GallerySectionState();
}

class _GallerySectionState extends State<GallerySection> {
  int? _selectedIndex;

  final List<Map<String, String>> _galleryImages = [
    {
      'url': 'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=800',
      'title': 'Dormitory Room',
    },
    {
      'url': 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=800',
      'title': 'Private Room',
    },
    {
      'url': 'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800',
      'title': 'Common Area',
    },
    {
      'url': 'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=800',
      'title': 'Lounge Space',
    },
    {
      'url': 'https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?w=800',
      'title': 'Coffee House',
    },
    {
      'url': 'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?w=800',
      'title': 'Spa Services',
    },
    {
      'url': 'https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=800',
      'title': 'Relaxation Area',
    },
    {
      'url': 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800',
      'title': 'Exterior View',
    },
    {
      'url': 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=800',
      'title': 'Workspace',
    },
    {
      'url': 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800',
      'title': 'Kitchen Area',
    },
    {
      'url': 'https://images.unsplash.com/photo-1507652313519-d4e9174996dd?w=800',
      'title': 'Bathroom',
    },
    {
      'url': 'https://images.unsplash.com/photo-1445019980597-93fa8acb246c?w=800',
      'title': 'Terrace',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: [
          Text(
            'Photo Gallery',
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2D5A8C),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Explore our hostel through images',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 18,
              color: const Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 56),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 2 : 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: _galleryImages.length,
            itemBuilder: (context, index) {
              return _buildGalleryImage(
                _galleryImages[index]['url']!,
                _galleryImages[index]['title']!,
                index,
              );
            },
          ),
          const SizedBox(height: 48),
          AnimatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'View all ${_galleryImages.length} photos',
                    style: GoogleFonts.poppins(),
                  ),
                  backgroundColor: const Color(0xFF2D5A8C),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF2D5A8C),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.photo_library, color: Colors.white),
                  const SizedBox(width: 12),
                  Text(
                    'View All Photos',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryImage(String url, String title, int index) {
    final isSelected = _selectedIndex == index;

    return AnimatedButton(
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
        _showImageDialog(url, title);
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => _selectedIndex = index),
        onExit: (_) => setState(() => _selectedIndex = null),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          transform: Matrix4.identity()
            ..scale(isSelected ? 1.05 : 1.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isSelected ? 0.15 : 0.08),
                blurRadius: isSelected ? 20 : 10,
                offset: Offset(0, isSelected ? 8 : 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(isSelected ? 0.7 : 0.4),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12,
                  left: 12,
                  right: 12,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: isSelected ? 1.0 : 0.0,
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                if (isSelected)
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.zoom_in,
                        color: Color(0xFF2D5A8C),
                        size: 24,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showImageDialog(String url, String title) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 900, maxHeight: 700),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          url,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2D5A8C),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: AnimatedButton(
                onPressed: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Color(0xFF2D5A8C),
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Location Section
class LocationSection extends StatelessWidget {
  const LocationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      color: const Color(0xFFF8F9FA),
      child: Column(
        children: [
          Text(
            'Location & Nearby',
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2D5A8C),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '141 บุญสัมพันธ์, Nong Prue, Pattaya, 20150',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 18,
              color: const Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 56),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _buildLocation('Pattaya Train Station', '2 miles', Icons.train),
              _buildLocation('Alcazar Cabaret', '3.6 miles', Icons.theater_comedy),
              _buildLocation('Mini Siam', '3.7 miles', Icons.location_city),
              _buildLocation('U-Tapao Airport', '27 miles', Icons.flight),
              _buildLocation('Restaurants & Shops', 'Nearby', Icons.restaurant),
              _buildLocation('ATMs & Laundry', 'Walking Distance', Icons.local_atm),
            ],
          ),
          const SizedBox(height: 48),
          AnimatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Opening Google Maps...',
                    style: GoogleFonts.poppins(),
                  ),
                  backgroundColor: const Color(0xFF2D5A8C),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF2D5A8C),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.map, color: Colors.white),
                  const SizedBox(width: 12),
                  Text(
                    'View on Google Maps',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocation(String name, String distance, IconData icon) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 32, color: const Color(0xFF2D5A8C)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  distance,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xFF666666),
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

// Reviews Section
class ReviewsSection extends StatelessWidget {
  const ReviewsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: [
          Text(
            'Guest Reviews',
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2D5A8C),
            ),
          ),
          const SizedBox(height: 56),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: const [
              ReviewCard(
                name: 'Sarah Johnson',
                rating: 5,
                review: 'The staff were so lovely, they made me feel very welcome and were very helpful. Clean rooms and comfortable beds. Great location!',
                date: 'December 2024',
              ),
              ReviewCard(
                name: 'Michael Chen',
                rating: 4,
                review: 'Nice quiet place to stay. AC works great and WiFi is fast. The coffee house is a nice touch. Would recommend for budget travelers.',
                date: 'November 2024',
              ),
              ReviewCard(
                name: 'Emma Wilson',
                rating: 5,
                review: 'Perfect hostel for solo travelers! Met great people in the shared lounge. Staff helped me rent a scooter. Very clean and organized.',
                date: 'January 2025',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final int rating;
  final String review;
  final String date;

  const ReviewCard({
    Key? key,
    required this.name,
    required this.rating,
    required this.review,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFF2D5A8C),
                child: Text(
                  name[0],
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      date,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: const Color(0xFF999999),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: const Color(0xFFFFC107),
                size: 20,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            review,
            style: GoogleFonts.poppins(
              fontSize: 14,
              height: 1.6,
              color: const Color(0xFF555555),
            ),
          ),
        ],
      ),
    );
  }
}

// Contact Section
class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      color: const Color(0xFFF8F9FA),
      child: Column(
        children: [
          Text(
            'Get in Touch',
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2D5A8C),
            ),
          ),
          const SizedBox(height: 56),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: [
              _buildContactCard(
                context,
                Icons.location_on,
                'Address',
                '141 บุญสัมพันธ์\nNong Prue, Pattaya, 20150\nThailand',
              ),
              _buildContactCard(
                context,
                Icons.phone,
                'Phone',
                '+66 123 456 789\nAvailable 24/7',
              ),
              _buildContactCard(
                context,
                Icons.email,
                'Email',
                'info@futurehostel.com\nSupport available',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(
    BuildContext context,
    IconData icon,
    String title,
    String info,
  ) {
    return AnimatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Contact info copied: $title',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: const Color(0xFF2D5A8C),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF2D5A8C).withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF2D5A8C).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: const Color(0xFF2D5A8C)),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: GoogleFonts.playfairDisplay(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2D5A8C),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              info,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                height: 1.6,
                color: const Color(0xFF666666),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Footer Section
class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.all(isMobile ? 32 : 48),
      color: const Color(0xFF1A1A1A),
      child: Column(
        children: [
          if (!isMobile)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFooterColumn(
                  'Quick Links',
                  ['Home', 'Rooms', 'Facilities', 'Gallery', 'Location'],
                ),
                _buildFooterColumn(
                  'Services',
                  ['Massage', 'Coffee House', 'Airport Transfer', 'Karaoke'],
                ),
                _buildFooterColumn(
                  'Policies',
                  ['Check-in: 2 PM', 'Check-out: 12 PM', 'Cash Only', 'Adults Only'],
                ),
              ],
            ),
          if (isMobile) ...[
            _buildFooterColumn(
              'Quick Links',
              ['Home', 'Rooms', 'Facilities', 'Gallery'],
            ),
            const SizedBox(height: 24),
          ],
          SizedBox(height: isMobile ? 24 : 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(context, Icons.facebook),
              const SizedBox(width: 16),
              _buildSocialIcon(context, Icons.photo_camera),
              const SizedBox(width: 16),
              _buildSocialIcon(context, Icons.language),
            ],
          ),
          const SizedBox(height: 32),
          Divider(color: Colors.white.withOpacity(0.2)),
          const SizedBox(height: 24),
          Text(
            '© 2025 Future Hostel Pattaya. All rights reserved.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.white70,
              fontSize: isMobile ? 12 : 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterColumn(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              item,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(BuildContext context, IconData icon) {
    return AnimatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Opening social media...',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: const Color(0xFF2D5A8C),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}