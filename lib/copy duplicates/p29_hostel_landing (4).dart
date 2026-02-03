import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

class P29HostelApp extends StatelessWidget {
  const P29HostelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'P29 Hostel Bangkok',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1A237E),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A237E),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      home: const P29LandingPage(),
    );
  }
}

// Language Model
enum Language { english, thai, russian, chinese }

class P29Translations {
  static final Map<Language, Map<String, String>> _translations = {
    Language.english: {
      'hostel_name': 'P29 Hostel Bangkok',
      'tagline': 'Urban Oasis in Bangkok\'s Heart',
      'location': 'Sukhumvit Area, Bangkok',
      'book_now': 'Book Your Stay',
      'explore': 'Discover',
      'welcome': 'Welcome to P29',
      'welcome_subtitle': 'Where Modern Design Meets Thai Hospitality',
      'welcome_desc':
          'P29 Hostel offers a unique blend of contemporary design and authentic Thai hospitality. Located in vibrant Sukhumvit, we provide comfortable accommodations with modern amenities, perfect for digital nomads, solo travelers, and groups.',
      'rooms': 'Accommodations',
      'rooms_subtitle': 'Designed for comfort and productivity',
      'dormitory': 'Premium Dormitory',
      'dorm_features': 'Privacy curtain, Personal locker, Reading light, USB ports',
      'private_room': 'Private Suite',
      'private_features': 'Ensuite bathroom, Workspace, Smart TV, City view',
      'facilities': 'Amenities',
      'free_wifi': 'High-Speed WiFi',
      'parking': 'Secure Parking',
      'co_work': 'Co-Working Space',
      'rooftop': 'Sky Garden Rooftop',
      'kitchen': 'Communal Kitchen',
      'laundry': 'Self-Service Laundry',
      'lounge': 'Social Lounge',
      'bike_rental': 'Bike Rental',
      'location_title': 'Prime Location',
      'location_subtitle': 'Connected to Everything',
      'nearby': 'Accessibility',
      'bts': 'BTS Skytrain',
      'malls': 'Shopping Malls',
      'nightlife': 'Night Markets',
      'reviews': 'Guest Experiences',
      'contact': 'Get in Touch',
      'address': 'Our Address',
      'address_full': '29 Sukhumvit Road, Khlong Toei,\nBangkok 10110, Thailand',
      'phone': 'Contact Number',
      'email': 'Email Address',
      'check_in': 'Check-in: 2:00 PM onwards',
      'check_out': 'Check-out: Until 12:00 PM',
      'gallery': 'Gallery',
      'view_all': 'View Gallery',
      'languages': 'Languages',
      'lang_staff': 'English, Thai, Chinese, Russian',
      'whatsapp_not_available': 'WhatsApp Not Available',
      'line_not_available': 'Line Not Available',
      'copy_number_message': 'Copy this number to contact us via WhatsApp:',
      'copy_line_id_message': 'Copy this Line ID to contact us via Line:',
      'choose_contact_method': 'How would you like to contact us?',
      'via_whatsapp': 'WhatsApp',
      'via_line': 'Line',
      'cancel': 'Cancel',
      'copy_number': 'Copy Number',
      'copy_line_id': 'Copy Line ID',
      'phone_number_copied': 'Phone number copied!',
      'line_id_copied': 'Line ID copied!',
      'whatsapp_message': 'Hi, I\'m interested in {roomName} at P29 Hostel.',
      'whatsapp_message_default': 'Hi, I\'m interested in P29 Hostel.',
      'address_copied': 'Address copied!',
      'phone_copied': 'Phone number copied!',
      'email_copied': 'Email copied!',
      'featured': 'Featured',
      'best_value': 'Best Value',
      'most_popular': 'Most Popular',
      'per_night': '/night',
      'starting_from': 'Starting from',
      'see_details': 'See Details',
      'view_room': 'View Room',
      'amenities': 'Amenities',
      'testimonials': 'Testimonials',
      'follow_us': 'Follow Our Journey',
      'quick_links': 'Quick Links',
      'privacy_policy': 'Privacy Policy',
      'terms_conditions': 'Terms & Conditions',
      'all_rights_reserved': 'All rights reserved',
    },
    Language.thai: {
      'hostel_name': 'P29 โฮสเทล กรุงเทพ',
      'tagline': 'โอเอซิสในใจกลางกรุงเทพ',
      'location': 'พื้นที่สุขุมวิท, กรุงเทพ',
      'book_now': 'จองที่พัก',
      'explore': 'สำรวจ',
      'welcome': 'ยินดีต้อนรับสู่ P29',
      'welcome_subtitle': 'ดีไซน์สมัยใหม่พบกับความเป็นไทย',
      'welcome_desc':
          'P29 โฮสเทลนำเสนอการผสมผสานระหว่างดีไซน์ร่วมสมัยและความเป็นไทย ตั้งอยู่ที่สุขุมวิทใจกลางเมือง เรามีที่พักสะดวกสบายพร้อมสิ่งอำนวยความสะดวกครบครัน เหมาะสำหรับนักเดินทางยุคดิจิทัลและกลุ่มเพื่อน',
      'rooms': 'ที่พัก',
      'rooms_subtitle': 'ออกแบบเพื่อความสะดวกสบายและการทำงาน',
      'dormitory': 'หอพักพรีเมียม',
      'dorm_features': 'ม่านกั้นส่วนตัว, ตู้ล็อคเกอร์, ไฟอ่านหนังสือ, พอร์ต USB',
      'private_room': 'สวีทส่วนตัว',
      'private_features': 'ห้องน้ำในตัว, พื้นที่ทำงาน, สมาร์ททีวี, วิวเมือง',
      'facilities': 'สิ่งอำนวยความสะดวก',
      'free_wifi': 'ไวไฟความเร็วสูง',
      'parking': 'ที่จอดรถปลอดภัย',
      'co_work': 'พื้นที่โคเวิร์คกิ้ง',
      'rooftop': 'สวนบนดาดฟ้า',
      'kitchen': 'ครัวส่วนกลาง',
      'laundry': 'ซักรีดบริการตนเอง',
      'lounge': 'เลานจ์สังสรรค์',
      'bike_rental': 'เช่าจักรยาน',
      'location_title': 'ทำเลที่ดี',
      'location_subtitle': 'เชื่อมต่อทุกที่',
      'nearby': 'การเดินทาง',
      'bts': 'BTS สกายเทรน',
      'malls': 'ห้างสรรพสินค้า',
      'nightlife': 'ตลาดกลางคืน',
      'reviews': 'ประสบการณ์ผู้เข้าพัก',
      'contact': 'ติดต่อเรา',
      'address': 'ที่อยู่',
      'address_full': '29 ถนนสุขุมวิท, คลองเตย,\nกรุงเทพ 10110, ประเทศไทย',
      'phone': 'เบอร์โทรศัพท์',
      'email': 'อีเมล',
      'check_in': 'เช็คอิน: 14:00 น. เป็นต้นไป',
      'check_out': 'เช็คเอาท์: จนถึง 12:00 น.',
      'gallery': 'แกลเลอรี',
      'view_all': 'ดูแกลเลอรี',
      'languages': 'ภาษา',
      'lang_staff': 'อังกฤษ, ไทย, จีน, รัสเซีย',
      'whatsapp_not_available': 'WhatsApp ไม่พร้อมใช้งาน',
      'line_not_available': 'Line ไม่พร้อมใช้งาน',
      'copy_number_message': 'คัดลอกหมายเลขเพื่อติดต่อผ่าน WhatsApp:',
      'copy_line_id_message': 'คัดลอก Line ID เพื่อติดต่อผ่าน Line:',
      'choose_contact_method': 'ต้องการติดต่อทางไหน?',
      'via_whatsapp': 'WhatsApp',
      'via_line': 'Line',
      'cancel': 'ยกเลิก',
      'copy_number': 'คัดลอกหมายเลข',
      'copy_line_id': 'คัดลอก Line ID',
      'phone_number_copied': 'คัดลอกหมายเลขแล้ว',
      'line_id_copied': 'คัดลอก Line ID แล้ว',
      'whatsapp_message': 'สวัสดี สนใจ {roomName} ที่ P29 โฮสเทลค่ะ/ครับ',
      'whatsapp_message_default': 'สวัสดี สนใจ P29 โฮสเทลค่ะ/ครับ',
      'address_copied': 'คัดลอกที่อยู่แล้ว',
      'phone_copied': 'คัดลอกหมายเลขแล้ว',
      'email_copied': 'คัดลอกอีเมลแล้ว',
      'featured': 'แนะนำ',
      'best_value': 'คุ้มค่าที่สุด',
      'most_popular': 'ยอดนิยม',
      'per_night': '/คืน',
      'starting_from': 'เริ่มต้น',
      'see_details': 'ดูรายละเอียด',
      'view_room': 'ดูห้องพัก',
      'amenities': 'สิ่งอำนวยความสะดวก',
      'testimonials': 'เสียงจากผู้ใช้บริการ',
      'follow_us': 'ติดตามเรา',
      'quick_links': 'ลิงค์ด่วน',
      'privacy_policy': 'นโยบายความเป็นส่วนตัว',
      'terms_conditions': 'ข้อกำหนดและเงื่อนไข',
      'all_rights_reserved': 'สงวนลิขสิทธิ์',
    },
    Language.russian: {
      'hostel_name': 'P29 Хостел Бангкок',
      'tagline': 'Городской оазис в сердце Бангкока',
      'location': 'Район Сукхумвит, Бангкок',
      'book_now': 'Забронировать',
      'explore': 'Исследовать',
      'welcome': 'Добро пожаловать в P29',
      'welcome_subtitle': 'Современный дизайн и тайское гостеприимство',
      'welcome_desc':
          'P29 Hostel предлагает уникальное сочетание современного дизайна и аутентичного тайского гостеприимства. Расположенный в оживленном Сукхумвите, мы предлагаем комфортное проживание с современными удобствами, идеально подходящее для цифровых кочевников и путешественников.',
      'rooms': 'Номера',
      'rooms_subtitle': 'Создано для комфорта и продуктивности',
      'dormitory': 'Премиум общий номер',
      'dorm_features': 'Штора для уединения, Личный шкафчик, Свет для чтения, USB-порты',
      'private_room': 'Личный номер',
      'private_features': 'Собственная ванная, Рабочее место, Smart TV, Вид на город',
      'facilities': 'Удобства',
      'free_wifi': 'Высокоскоростной Wi-Fi',
      'parking': 'Безопасная парковка',
      'co_work': 'Коворкинг пространство',
      'rooftop': 'Крыша с садом',
      'kitchen': 'Общая кухня',
      'laundry': 'Прачечная самообслуживания',
      'lounge': 'Общая гостиная',
      'bike_rental': 'Аренда велосипедов',
      'location_title': 'Отличное расположение',
      'location_subtitle': 'Связь со всем городом',
      'nearby': 'Доступность',
      'bts': 'BTS Скайтрэйн',
      'malls': 'Торговые центры',
      'nightlife': 'Ночные рынки',
      'reviews': 'Отзывы гостей',
      'contact': 'Связаться с нами',
      'address': 'Наш адрес',
      'address_full': '29 Сукхумвит Роуд, Клонг Туей,\nБангкок 10110, Таиланд',
      'phone': 'Телефон',
      'email': 'Электронная почта',
      'check_in': 'Заезд: с 14:00',
      'check_out': 'Выезд: до 12:00',
      'gallery': 'Галерея',
      'view_all': 'Смотреть галерею',
      'languages': 'Языки',
      'lang_staff': 'Английский, Тайский, Китайский, Русский',
      'whatsapp_not_available': 'WhatsApp недоступен',
      'line_not_available': 'Line недоступен',
      'copy_number_message': 'Скопируйте номер для связи через WhatsApp:',
      'copy_line_id_message': 'Скопируйте Line ID для связи через Line:',
      'choose_contact_method': 'Как связаться с нами?',
      'via_whatsapp': 'WhatsApp',
      'via_line': 'Line',
      'cancel': 'Отмена',
      'copy_number': 'Скопировать номер',
      'copy_line_id': 'Скопировать Line ID',
      'phone_number_copied': 'Номер скопирован',
      'line_id_copied': 'Line ID скопирован',
      'whatsapp_message': 'Здравствуйте, меня интересует {roomName} в P29 Hostel.',
      'whatsapp_message_default': 'Здравствуйте, меня интересует P29 Hostel.',
      'address_copied': 'Адрес скопирован',
      'phone_copied': 'Номер скопирован',
      'email_copied': 'Email скопирован',
      'featured': 'Рекомендуем',
      'best_value': 'Лучшая цена',
      'most_popular': 'Популярный',
      'per_night': '/ночь',
      'starting_from': 'От',
      'see_details': 'Подробнее',
      'view_room': 'Посмотреть номер',
      'amenities': 'Удобства',
      'testimonials': 'Отзывы',
      'follow_us': 'Подписывайтесь',
      'quick_links': 'Быстрые ссылки',
      'privacy_policy': 'Политика конфиденциальности',
      'terms_conditions': 'Условия использования',
      'all_rights_reserved': 'Все права защищены',
    },
    Language.chinese: {
      'hostel_name': 'P29 曼谷旅舍',
      'tagline': '曼谷市中心的城市绿洲',
      'location': '素坤逸区, 曼谷',
      'book_now': '立即预订',
      'explore': '探索',
      'welcome': '欢迎来到 P29',
      'welcome_subtitle': '现代设计与泰式款待的完美结合',
      'welcome_desc':
          'P29旅舍融合现代设计理念与泰式热情好客。位于繁华的素坤逸区，我们提供舒适的住宿和现代化设施，非常适合数字游民、独自旅行者和团体旅客。',
      'rooms': '房型',
      'rooms_subtitle': '为舒适和效率而设计',
      'dormitory': '高级宿舍',
      'dorm_features': '隐私窗帘, 个人储物柜, 阅读灯, USB接口',
      'private_room': '私人套房',
      'private_features': '独立卫浴, 工作区, 智能电视, 城市景观',
      'facilities': '设施',
      'free_wifi': '高速WiFi',
      'parking': '安全停车场',
      'co_work': '共享办公空间',
      'rooftop': '空中花园屋顶',
      'kitchen': '公共厨房',
      'laundry': '自助洗衣房',
      'lounge': '社交休息室',
      'bike_rental': '自行车租赁',
      'location_title': '优越位置',
      'location_subtitle': '连接全城',
      'nearby': '交通便利',
      'bts': 'BTS轻轨',
      'malls': '购物中心',
      'nightlife': '夜市',
      'reviews': '客人体验',
      'contact': '联系我们',
      'address': '地址',
      'address_full': '29 素坤逸路, 空堤,\n曼谷 10110, 泰国',
      'phone': '联系电话',
      'email': '电子邮箱',
      'check_in': '入住: 下午2:00起',
      'check_out': '退房: 中午12:00前',
      'gallery': '图库',
      'view_all': '查看图库',
      'languages': '语言',
      'lang_staff': '英语, 泰语, 中文, 俄语',
      'whatsapp_not_available': 'WhatsApp 不可用',
      'line_not_available': 'Line 不可用',
      'copy_number_message': '复制号码通过 WhatsApp 联系我们:',
      'copy_line_id_message': '复制 Line ID 通过 Line 联系我们:',
      'choose_contact_method': '如何联系我们?',
      'via_whatsapp': 'WhatsApp',
      'via_line': 'Line',
      'cancel': '取消',
      'copy_number': '复制号码',
      'copy_line_id': '复制 Line ID',
      'phone_number_copied': '号码已复制',
      'line_id_copied': 'Line ID 已复制',
      'whatsapp_message': '您好, 我对P29旅舍的{roomName}感兴趣。',
      'whatsapp_message_default': '您好, 我对P29旅舍感兴趣。',
      'address_copied': '地址已复制',
      'phone_copied': '号码已复制',
      'email_copied': '邮箱已复制',
      'featured': '特色推荐',
      'best_value': '性价比最高',
      'most_popular': '最受欢迎',
      'per_night': '/晚',
      'starting_from': '起价',
      'see_details': '查看详情',
      'view_room': '查看房间',
      'amenities': '设施',
      'testimonials': '客户评价',
      'follow_us': '关注我们',
      'quick_links': '快速链接',
      'privacy_policy': '隐私政策',
      'terms_conditions': '条款与条件',
      'all_rights_reserved': '版权所有',
    },
  };

  static String get(Language lang, String key) {
    return _translations[lang]?[key] ?? _translations[Language.english]![key]!;
  }
}

// Utility functions
Future<void> p29LaunchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

class P29LandingPage extends StatefulWidget {
  const P29LandingPage({Key? key}) : super(key: key);

  @override
  State<P29LandingPage> createState() => _P29LandingPageState();
}

class _P29LandingPageState extends State<P29LandingPage> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  Language _currentLanguage = Language.english;
  int _currentIndex = 0;
  AnimationController? _animationController;

  // Keys for scroll-to-section
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _roomsKey = GlobalKey();
  final GlobalKey _amenitiesKey = GlobalKey();
  final GlobalKey _galleryKey = GlobalKey();
  final GlobalKey _locationKey = GlobalKey();
  final GlobalKey _testimonialsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    setState(() {
      
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController?.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _changeLanguage(Language lang) {
    setState(() {
      _currentLanguage = lang;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Language changed to ${lang.name}'),
        backgroundColor: const Color(0xFF1A237E),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  String t(String key) => P29Translations.get(_currentLanguage, key);

  // Modern floating action button for booking
  void _showBookingDialog({String? roomName}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => BookingModal(
        t: t,
        roomName: roomName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: isMobile ? null : _buildDesktopAppBar(),
      drawer: isMobile ? _buildMobileDrawer() : null,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showBookingDialog(),
        backgroundColor: const Color(0xFF1A237E),
        foregroundColor: Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        icon: const Icon(Icons.calendar_today, size: 20),
        label: Text(
          t('book_now'),
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFFF8F9FA),
                  const Color(0xFFE8EAF6).withOpacity(0.5),
                ],
              ),
            ),
          ),
          
          // Main content
          ListView(
            controller: _scrollController,
            children: [
              // Hero Section
              if (_animationController != null)
              HeroSection(
                key: _heroKey,
                t: t,
                onBookNow: () => _scrollToSection(_roomsKey),
                animationController: _animationController!,
              ),

              // Rooms Section
              RoomsSection(
                key: _roomsKey,
                t: t,
                onBookNow: _showBookingDialog,
              ),

              // Amenities Section
              AmenitiesSection(
                key: _amenitiesKey,
                t: t,
              ),

              // Gallery Section
              GallerySection(
                key: _galleryKey,
                t: t,
              ),

              // Location Section
              LocationSection(
                key: _locationKey,
                t: t,
              ),

              // Testimonials Section
              TestimonialsSection(
                key: _testimonialsKey,
                t: t,
              ),

              // Contact Section
              ContactSection(
                key: _contactKey,
                t: t,
              ),

              // Footer
              FooterSection(t: t),
            ],
          ),

          // Mobile App Bar
          if (isMobile) _buildMobileAppBar(),
        ],
      ),
      bottomNavigationBar: isMobile ? _buildMobileBottomNav() : null,
    );
  }

  PreferredSizeWidget _buildDesktopAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF1A237E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'P29',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            t('hostel_name'),
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: const Color(0xFF1A237E),
            ),
          ),
        ],
      ),
      actions: [
        _buildNavItem(t('welcome'), _heroKey),
        _buildNavItem(t('rooms'), _roomsKey),
        _buildNavItem(t('amenities'), _amenitiesKey),
        _buildNavItem(t('gallery'), _galleryKey),
        _buildNavItem(t('location_title'), _locationKey),
        _buildNavItem(t('testimonials'), _testimonialsKey),
        _buildNavItem(t('contact'), _contactKey),
        _buildLanguageSelector(),
        const SizedBox(width: 20),
      ],
    );
  }

  Widget _buildMobileAppBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.5),
              Colors.transparent,
            ],
          ),
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'P29',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF1A237E),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                t('hostel_name'),
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          actions: [
            _buildLanguageSelector(),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(Icons.home, t('welcome'), _heroKey),
            _buildBottomNavItem(Icons.bed, t('rooms'), _roomsKey),
            _buildBottomNavItem(Icons.photo_library, t('gallery'), _galleryKey),
            _buildBottomNavItem(Icons.phone, t('contact'), _contactKey),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, GlobalKey key) {
    return IconButton(
      onPressed: () => _scrollToSection(key),
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24, color: const Color(0xFF1A237E)),
          const SizedBox(height: 4),
          Text(
            label.split(' ')[0],
            style: GoogleFonts.poppins(
              fontSize: 10,
              color: const Color(0xFF1A237E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String text, GlobalKey key) {
    return TextButton(
      onPressed: () => _scrollToSection(key),
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF1A237E),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildLanguageSelector() {
    return PopupMenuButton<Language>(
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF1A237E).withOpacity(0.3)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.language, size: 16, color: Color(0xFF1A237E)),
            const SizedBox(width: 4),
            Text(
              _getLanguageCode(_currentLanguage),
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1A237E),
              ),
            ),
          ],
        ),
      ),
      onSelected: _changeLanguage,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: Language.english,
          child: Row(
            children: [
              const Text('🇬🇧'),
              const SizedBox(width: 12),
              Text('English',
                  style: GoogleFonts.poppins(
                      color: _currentLanguage == Language.english
                          ? const Color(0xFF1A237E)
                          : Colors.black87,
                      fontWeight: _currentLanguage == Language.english
                          ? FontWeight.bold
                          : FontWeight.normal)),
            ],
          ),
        ),
        PopupMenuItem(
          value: Language.thai,
          child: Row(
            children: [
              const Text('🇹🇭'),
              const SizedBox(width: 12),
              Text('ไทย',
                  style: GoogleFonts.poppins(
                      color: _currentLanguage == Language.thai
                          ? const Color(0xFF1A237E)
                          : Colors.black87,
                      fontWeight: _currentLanguage == Language.thai
                          ? FontWeight.bold
                          : FontWeight.normal)),
            ],
          ),
        ),
        PopupMenuItem(
          value: Language.russian,
          child: Row(
            children: [
              const Text('🇷🇺'),
              const SizedBox(width: 12),
              Text('Русский',
                  style: GoogleFonts.poppins(
                      color: _currentLanguage == Language.russian
                          ? const Color(0xFF1A237E)
                          : Colors.black87,
                      fontWeight: _currentLanguage == Language.russian
                          ? FontWeight.bold
                          : FontWeight.normal)),
            ],
          ),
        ),
        PopupMenuItem(
          value: Language.chinese,
          child: Row(
            children: [
              const Text('🇨🇳'),
              const SizedBox(width: 12),
              Text('中文',
                  style: GoogleFonts.poppins(
                      color: _currentLanguage == Language.chinese
                          ? const Color(0xFF1A237E)
                          : Colors.black87,
                      fontWeight: _currentLanguage == Language.chinese
                          ? FontWeight.bold
                          : FontWeight.normal)),
            ],
          ),
        ),
      ],
    );
  }

  String _getLanguageCode(Language lang) {
    switch (lang) {
      case Language.english:
        return 'EN';
      case Language.thai:
        return 'TH';
      case Language.russian:
        return 'RU';
      case Language.chinese:
        return 'CN';
    }
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF1A237E), Color(0xFF3949AB)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'P29',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF1A237E),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  t('hostel_name'),
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  t('tagline'),
                  style: GoogleFonts.poppins(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Color(0xFF1A237E)),
            title: Text(t('welcome')),
            onTap: () {
              Navigator.pop(context);
              _scrollToSection(_heroKey);
            },
          ),
          ListTile(
            leading: const Icon(Icons.bed, color: Color(0xFF1A237E)),
            title: Text(t('rooms')),
            onTap: () {
              Navigator.pop(context);
              _scrollToSection(_roomsKey);
            },
          ),
          ListTile(
            leading: const Icon(Icons.spa, color: Color(0xFF1A237E)),
            title: Text(t('amenities')),
            onTap: () {
              Navigator.pop(context);
              _scrollToSection(_amenitiesKey);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library, color: Color(0xFF1A237E)),
            title: Text(t('gallery')),
            onTap: () {
              Navigator.pop(context);
              _scrollToSection(_galleryKey);
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on, color: Color(0xFF1A237E)),
            title: Text(t('location_title')),
            onTap: () {
              Navigator.pop(context);
              _scrollToSection(_locationKey);
            },
          ),
          ListTile(
            leading: const Icon(Icons.star, color: Color(0xFF1A237E)),
            title: Text(t('testimonials')),
            onTap: () {
              Navigator.pop(context);
              _scrollToSection(_testimonialsKey);
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone, color: Color(0xFF1A237E)),
            title: Text(t('contact')),
            onTap: () {
              Navigator.pop(context);
              _scrollToSection(_contactKey);
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => _showBookingDialog(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A237E),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.calendar_today, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    t('book_now'),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
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
}

// Hero Section with Glassmorphism Effect
class HeroSection extends StatelessWidget {
  final String Function(String) t;
  final VoidCallback onBookNow;
  final AnimationController animationController;

  const HeroSection({
    Key? key,
    required this.t,
    required this.onBookNow,
    required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF1A237E).withOpacity(0.9),
            const Color(0xFF3949AB).withOpacity(0.7),
          ],
        ),
        image: DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=1920&auto=format&fit=crop',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: Stack(
        children: [
          // Animated floating elements
          Positioned(
            top: 100,
            right: isMobile ? -50 : 100,
            child: _buildFloatingElement(Icons.king_bed, 80),
          ),
          Positioned(
            bottom: 150,
            left: isMobile ? -30 : 50,
            child: _buildFloatingElement(Icons.wifi, 60),
          ),
          Positioned(
            top: 300,
            left: isMobile ? -40 : 150,
            child: _buildFloatingElement(Icons.pool, 70),
          ),

          // Content
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                    child: Text(
                      t('featured').toUpperCase(),
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Main Title
                  Text(
                    t('hostel_name'),
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: isMobile ? 42 : 64,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Tagline
                  Text(
                    t('tagline'),
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: isMobile ? 18 : 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Location
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.white, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        t('location'),
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),

                  // CTA Buttons
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: onBookNow,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF1A237E),
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 32 : 48,
                            vertical: isMobile ? 16 : 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 8,
                        ),
                        child: Text(
                          t('book_now'),
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: isMobile ? 16 : 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white),
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 24 : 40,
                            vertical: isMobile ? 16 : 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          t('explore'),
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: isMobile ? 16 : 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Scroll indicator
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'Scroll to explore',
                  style: GoogleFonts.poppins(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                const Icon(
                  Icons.expand_more,
                  color: Colors.white,
                  size: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingElement(IconData icon, double size) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, sin(animationController.value * 2 * pi) * 10),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Icon(
              icon,
              color: Colors.white.withOpacity(0.3),
              size: size * 0.5,
            ),
          ),
        );
      },
    );
  }
}

// Rooms Section with Modern Cards
class RoomsSection extends StatelessWidget {
  final String Function(String) t;
  final Function({String? roomName}) onBookNow;

  const RoomsSection({
    Key? key,
    required this.t,
    required this.onBookNow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
        horizontal: isMobile ? 24 : 48,
      ),
      color: Colors.white,
      child: Column(
        children: [
          // Section Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF1A237E).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              t('rooms').toUpperCase(),
              style: GoogleFonts.poppins(
                color: const Color(0xFF1A237E),
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            t('rooms_subtitle'),
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 28 : 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A237E),
            ),
          ),
          const SizedBox(height: 48),

          // Room Cards
          isMobile ? _buildMobileRooms() : _buildDesktopRooms(),
        ],
      ),
    );
  }

  Widget _buildMobileRooms() {
    return Column(
      children: [
        RoomCard(
          title: t('dormitory'),
          subtitle: t('most_popular'),
          price: '฿450',
          features: t('dorm_features'),
          image: 'https://images.unsplash.com/photo-1560185893-a55cbc8c57e8?w=800',
          t: t,
          onBookNow: () => onBookNow(roomName: t('dormitory')),
          isFeatured: true,
        ),
        const SizedBox(height: 32),
        RoomCard(
          title: t('private_room'),
          subtitle: t('best_value'),
          price: '฿1,200',
          features: t('private_features'),
          image: 'https://images.unsplash.com/photo-1615873968403-89e068629265?w=800',
          t: t,
          onBookNow: () => onBookNow(roomName: t('private_room')),
          isFeatured: false,
        ),
      ],
    );
  }

  Widget _buildDesktopRooms() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoomCard(
          title: t('dormitory'),
          subtitle: t('most_popular'),
          price: '฿450',
          features: t('dorm_features'),
          image: 'https://images.unsplash.com/photo-1560185893-a55cbc8c57e8?w=800',
          t: t,
          onBookNow: () => onBookNow(roomName: t('dormitory')),
          isFeatured: true,
        ),
        const SizedBox(width: 32),
        RoomCard(
          title: t('private_room'),
          subtitle: t('best_value'),
          price: '฿1,200',
          features: t('private_features'),
          image: 'https://images.unsplash.com/photo-1615873968403-89e068629265?w=800',
          t: t,
          onBookNow: () => onBookNow(roomName: t('private_room')),
          isFeatured: false,
        ),
      ],
    );
  }
}

class RoomCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String price;
  final String features;
  final String image;
  final String Function(String) t;
  final VoidCallback onBookNow;
  final bool isFeatured;

  const RoomCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.features,
    required this.image,
    required this.t,
    required this.onBookNow,
    required this.isFeatured,
  }) : super(key: key);

  @override
  State<RoomCard> createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isMobile ? double.infinity : 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1A237E).withOpacity(_isHovered ? 0.2 : 0.1),
              blurRadius: _isHovered ? 40 : 20,
              offset: Offset(0, _isHovered ? 15 : 8),
            ),
          ],
          border: Border.all(
            color: widget.isFeatured
                ? const Color(0xFF1A237E).withOpacity(0.2)
                : Colors.transparent,
            width: 2,
          ),
        ),
        transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with badge
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    widget.image,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                if (widget.isFeatured)
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF1A237E), Color(0xFF3949AB)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        widget.subtitle,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1A237E),
                        ),
                      ),
                      Text(
                        '${widget.price}${widget.t('per_night')}',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1A237E),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.t('starting_from'),
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF666666),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 20),
                  Text(
                    widget.features,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF555555),
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF1A237E),
                            side: const BorderSide(color: Color(0xFF1A237E)),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(widget.t('view_room')),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: widget.onBookNow,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1A237E),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                          ),
                          child: Text(widget.t('book_now')),
                        ),
                      ),
                    ],
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

// Amenities Section with Grid
class AmenitiesSection extends StatelessWidget {
  final String Function(String) t;

  const AmenitiesSection({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
        horizontal: isMobile ? 24 : 48,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            const Color(0xFFF8F9FA),
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF1A237E).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              t('amenities').toUpperCase(),
              style: GoogleFonts.poppins(
                color: const Color(0xFF1A237E),
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            t('facilities'),
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 28 : 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A237E),
            ),
          ),
          const SizedBox(height: 48),

          // Grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 2 : 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1,
            children: [
              _buildAmenityCard(Icons.wifi, t('free_wifi')),
              _buildAmenityCard(Icons.work, t('co_work')),
              _buildAmenityCard(Icons.roofing, t('rooftop')),
              _buildAmenityCard(Icons.kitchen, t('kitchen')),
              _buildAmenityCard(Icons.local_laundry_service, t('laundry')),
              _buildAmenityCard(Icons.people, t('lounge')),
              _buildAmenityCard(Icons.directions_bike, t('bike_rental')),
              _buildAmenityCard(Icons.local_parking, t('parking')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAmenityCard(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A237E).withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1A237E), Color(0xFF3949AB)],
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 32),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1A237E),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Gallery Section with Masonry Layout
class GallerySection extends StatelessWidget {
  final String Function(String) t;

  const GallerySection({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
        horizontal: isMobile ? 24 : 48,
      ),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF1A237E).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              t('gallery').toUpperCase(),
              style: GoogleFonts.poppins(
                color: const Color(0xFF1A237E),
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            t('gallery'),
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 28 : 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A237E),
            ),
          ),
          const SizedBox(height: 48),

          // Masonry Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 2 : 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  _getGalleryImage(index),
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: const Color(0xFFF8F9FA),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: const Color(0xFF1A237E),
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String _getGalleryImage(int index) {
    final images = [
      'https://images.unsplash.com/photo-1560185893-a55cbc8c57e8?w=600',
      'https://images.unsplash.com/photo-1615873968403-89e068629265?w=600',
      'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=600',
      'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=600',
      'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=600',
      'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=600',
    ];
    return images[index % images.length];
  }
}

// Location Section with Map Preview
class LocationSection extends StatelessWidget {
  final String Function(String) t;

  const LocationSection({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
        horizontal: isMobile ? 24 : 48,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1A237E).withOpacity(0.05),
            Colors.white,
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF1A237E).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              t('location_title').toUpperCase(),
              style: GoogleFonts.poppins(
                color: const Color(0xFF1A237E),
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            t('location_subtitle'),
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 28 : 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A237E),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            t('nearby'),
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: const Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 48),

          // Location Info
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1A237E).withOpacity(0.1),
                  blurRadius: 30,
                  offset: const Offset(0, 20),
                ),
              ],
            ),
            child: isMobile ? _buildMobileLocation() : _buildDesktopLocation(),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLocation() {
    return Column(
      children: [
        // Map Preview
        GestureDetector(
          onTap: () => p29LaunchUrl('https://maps.app.goo.gl/3sBK1soZc17SryyaA'),
          child: Container(
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1558036117-15e82a2c9a9a?w=800',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.map, color: Color(0xFF1A237E), size: 16),
                    const SizedBox(width: 8),
                    Text(
                      'View on Google Maps',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF1A237E),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t('address'),
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A237E),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                t('address_full'),
                style: GoogleFonts.poppins(
                  color: const Color(0xFF555555),
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _buildLocationFeature(Icons.train, t('bts'), '5 min walk'),
                  _buildLocationFeature(Icons.shopping_cart, t('malls'), '10 min'),
                  _buildLocationFeature(Icons.nightlife, t('nightlife'), '15 min'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLocation() {
    return Row(
      children: [
        // Map Preview
        Expanded(
          child: GestureDetector(
            onTap: () => p29LaunchUrl('https://maps.app.goo.gl/3sBK1soZc17SryyaA'),
            child: Container(
              height: 400,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1558036117-15e82a2c9a9a?w=1200',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.map, color: Color(0xFF1A237E), size: 18),
                      const SizedBox(width: 8),
                      Text(
                        'View on Google Maps',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF1A237E),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        // Location Info
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t('address'),
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A237E),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  t('address_full'),
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF555555),
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    _buildLocationFeature(Icons.train, t('bts'), '5 min walk'),
                    _buildLocationFeature(Icons.shopping_cart, t('malls'), '10 min'),
                    _buildLocationFeature(Icons.nightlife, t('nightlife'), '15 min'),
                  ],
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () => p29LaunchUrl('https://maps.app.goo.gl/3sBK1soZc17SryyaA'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A237E),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Get Directions'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationFeature(IconData icon, String title, String distance) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A237E).withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1A237E).withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF1A237E), size: 32),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: const Color(0xFF1A237E),
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
    );
  }
}

// Testimonials Section with Carousel
class TestimonialsSection extends StatelessWidget {
  final String Function(String) t;

  const TestimonialsSection({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
        horizontal: isMobile ? 24 : 48,
      ),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF1A237E).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              t('testimonials').toUpperCase(),
              style: GoogleFonts.poppins(
                color: const Color(0xFF1A237E),
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            t('reviews'),
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 28 : 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A237E),
            ),
          ),
          const SizedBox(height: 48),

          // Testimonials
          SizedBox(
            height: isMobile ? 400 : 300,
            child: PageView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 48),
                  child: TestimonialCard(index: index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final int index;

  const TestimonialCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final testimonials = [
      {
        'name': 'Sarah Chen',
        'country': 'Singapore',
        'text': 'Perfect location, amazing facilities. The co-working space was exactly what I needed as a digital nomad. Will definitely return!',
        'rating': 5,
      },
      {
        'name': 'Dmitry Ivanov',
        'country': 'Russia',
        'text': 'Очень чистый и современный хостел. Персонал говорит по-русски, что очень удобно. Отличное соотношение цены и качества.',
        'rating': 4,
      },
      {
        'name': '王小明',
        'country': 'China',
        'text': '位置极佳，步行到BTS站只需5分钟。房间干净舒适，工作人员非常友好。强烈推荐给来曼谷的游客。',
        'rating': 5,
      },
    ];

    final testimonial = testimonials[index];

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: const Color(0xFF1A237E).withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1A237E), Color(0xFF3949AB)],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "${testimonial['name']}"[0],
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${testimonial['name']}",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1A237E),
                        ),
                      ),
                      Text(
                        "${testimonial['country']}",
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF666666),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: List.generate(
                    5,
                    (i) => Icon(
                      i < (testimonial['rating'] as int) ? Icons.star : Icons.star_border,
                      color: const Color(0xFFFFB800),
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Text(
                "${testimonial['text']}",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xFF555555),
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              'Google Review',
              style: GoogleFonts.poppins(
                color: const Color(0xFF1A237E),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Contact Section
class ContactSection extends StatelessWidget {
  final String Function(String) t;

  const ContactSection({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
        horizontal: isMobile ? 24 : 48,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1A237E).withOpacity(0.05),
            Colors.white,
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF1A237E).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              t('contact').toUpperCase(),
              style: GoogleFonts.poppins(
                color: const Color(0xFF1A237E),
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            t('contact'),
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 28 : 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A237E),
            ),
          ),
          const SizedBox(height: 48),

          // Contact Cards
          isMobile ? _buildMobileContact(context) : _buildDesktopContact(context),
        ],
      ),
    );
  }

  Widget _buildMobileContact(BuildContext context) {
    return Column(
      children: [
        _buildContactCard(
          Icons.location_on,
          t('address'),
          t('address_full'),
          () {
            Clipboard.setData(ClipboardData(text: t('address_full')));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(t('address_copied')),
                backgroundColor: const Color(0xFF1A237E),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        _buildContactCard(
          Icons.phone,
          t('phone'),
          '+66 90 123 4567',
          () {
            Clipboard.setData(const ClipboardData(text: '+66901234567'));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(t('phone_copied')),
                backgroundColor: const Color(0xFF1A237E),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        _buildContactCard(
          Icons.email,
          t('email'),
          'info@p29hostel.com',
          () {
            Clipboard.setData(const ClipboardData(text: 'info@p29hostel.com'));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(t('email_copied')),
                backgroundColor: const Color(0xFF1A237E),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDesktopContact(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildContactCard(
          Icons.location_on,
          t('address'),
          t('address_full'),
          () {
            Clipboard.setData(ClipboardData(text: t('address_full')));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(t('address_copied')),
                backgroundColor: const Color(0xFF1A237E),
              ),
            );
          },
        ),
        const SizedBox(width: 24),
        _buildContactCard(
          Icons.phone,
          t('phone'),
          '+66 90 123 4567',
          () {
            Clipboard.setData(const ClipboardData(text: '+66901234567'));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(t('phone_copied')),
                backgroundColor: const Color(0xFF1A237E),
              ),
            );
          },
        ),
        const SizedBox(width: 24),
        _buildContactCard(
          Icons.email,
          t('email'),
          'info@p29hostel.com',
          () {
            Clipboard.setData(const ClipboardData(text: 'info@p29hostel.com'));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(t('email_copied')),
                backgroundColor: const Color(0xFF1A237E),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildContactCard(
    IconData icon,
    String title,
    String content,
    VoidCallback onLongPress,
  ) {
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: () {
        if (icon == Icons.phone) {
          p29LaunchUrl('tel:+66901234567');
        } else if (icon == Icons.email) {
          p29LaunchUrl('mailto:info@p29hostel.com');
        } else if (icon == Icons.location_on) {
          p29LaunchUrl('https://maps.app.goo.gl/3sBK1soZc17SryyaA');
        }
      },
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1A237E).withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1A237E), Color(0xFF3949AB)],
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 32),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A237E),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              content,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: const Color(0xFF555555),
                height: 1.6,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Tap to open • Long press to copy',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: const Color(0xFF888888),
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
  final String Function(String) t;

  const FooterSection({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      color: const Color(0xFF1A237E),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 60,
        horizontal: isMobile ? 24 : 48,
      ),
      child: Column(
        children: [
          // Logo and Tagline
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'P29',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF1A237E),
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                t('hostel_name'),
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                t('tagline'),
                style: GoogleFonts.poppins(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

          // Social Media
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(Icons.photo_camera, () {
                p29LaunchUrl('https://instagram.com/p29hostel');
              }),
              const SizedBox(width: 20),
              _buildSocialIcon(Icons.facebook, () {
                p29LaunchUrl('https://facebook.com/p29hostel');
              }),
              const SizedBox(width: 20),
              _buildSocialIcon(Icons.music_note, () {
                p29LaunchUrl('https://tiktok.com/@p29hostel');
              }),
              const SizedBox(width: 20),
              _buildSocialIcon(Icons.chat, () {
                p29LaunchUrl('https://line.me/R/ti/p/@p29hostel');
              }),
            ],
          ),
          const SizedBox(height: 40),

          // Quick Links
          Wrap(
            spacing: 24,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  t('rooms'),
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  t('amenities'),
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  t('location_title'),
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  t('contact'),
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  t('privacy_policy'),
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  t('terms_conditions'),
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Divider(color: Colors.white24),
          const SizedBox(height: 24),
          Text(
            '© ${DateTime.now().year} P29 Hostel Bangkok. ${t('all_rights_reserved')}',
            style: GoogleFonts.poppins(
              color: Colors.white.withOpacity(0.6),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}

// Booking Modal
class BookingModal extends StatelessWidget {
  final String Function(String) t;
  final String? roomName;

  const BookingModal({
    Key? key,
    required this.t,
    this.roomName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            t('choose_contact_method'),
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A237E),
            ),
          ),
          const SizedBox(height: 32),
          _buildContactOption(
            Icons.chat,
            t('via_whatsapp'),
            '+66 90 123 4567',
            () {
              final message = roomName != null
                  ? t('whatsapp_message').replaceAll('{roomName}', roomName!)
                  : t('whatsapp_message_default');
              p29LaunchUrl(
                  'https://wa.me/66901234567?text=${Uri.encodeComponent(message)}');
            },
            Colors.green,
          ),
          const SizedBox(height: 20),
          _buildContactOption(
            Icons.message,
            t('via_line'),
            '@p29hostel',
            () {
              p29LaunchUrl('https://line.me/R/ti/p/@p29hostel');
            },
            Colors.green[700]!,
          ),
          const SizedBox(height: 32),
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF1A237E),
              side: const BorderSide(color: Color(0xFF1A237E)),
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(t('cancel')),
          ),
        ],
      ),
    );
  }

  Widget _buildContactOption(
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
    Color color,
  ) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey[200]!),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A237E),
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}