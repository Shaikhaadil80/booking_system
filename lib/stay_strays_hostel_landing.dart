import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class StayStraysHostelApp extends StatelessWidget {
  const StayStraysHostelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stay Strays Hostel Bangkok',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFFF6B35),
        scaffoldBackgroundColor: const Color(0xFFFFFBF7),
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: const LandingPage(),
    );
  }
}

// Language Model
enum Language { english, thai, russian, chinese }

class Translations {
  static final Map<Language, Map<String, String>> _translations = {
    Language.english: {
      'hostel_name': 'Stay Strays Hostel',
      'tagline': 'Your Bangkok Adventure Starts Here',
      'location': 'Nong Khaem, Bangkok',
      'book_now': 'Book Now',
      'explore': 'Explore',
      'welcome': 'Welcome to Stay Strays',
      'welcome_subtitle': 'Modern comfort meets Bangkok charm',
      'welcome_desc': 'Located in the peaceful Nong Khaem district, Stay Strays Hostel offers modern family rooms with air-conditioning, private bathrooms, and stunning garden or city views. Each room features a balcony, washing machine, and free WiFi. Relax in our garden, terrace, or bar while enjoying our minimarket and coffee shop.',
      'rooms': 'Our Rooms',
      'rooms_subtitle': 'Comfortable stays for every traveler',
      'family_room': 'Family Room',
      'family_features': 'Air-conditioning, Private bathroom, City view, Balcony',
      'garden_room': 'Garden View Room',
      'garden_features': 'Garden view, Washing machine, Free WiFi, Terrace',
      'facilities': 'Facilities',
      'free_wifi': 'Free WiFi',
      'parking': 'Free Parking',
      'garden': 'Garden & Terrace',
      'bar': 'Bar & Coffee Shop',
      'minimarket': 'Mini Market',
      'security': '24H Security',
      'housekeeping': 'Daily Housekeeping',
      'non_smoking': 'Non-Smoking',
      'location_title': 'Location',
      'location_subtitle': 'Discover Bangkok from Stay Strays',
      'nearby': 'Nearby Attractions',
      'wat_arun': 'Wat Arun',
      'grand_palace': 'Grand Palace',
      'floating_market': 'Floating Market',
      'reviews': 'Guest Reviews',
      'contact': 'Contact Us',
      'address': 'Address',
      'address_full': '55/7 Liap Khlong Phasi Charoen Fang Nuea 10 Alley\nNong Khaem, Bangkok 10160\nThailand',
      'phone': 'Phone',
      'email': 'Email',
      'check_in': 'Check-in: 2:00 PM',
      'check_out': 'Check-out: 7:00 AM - 12:00 PM',
      'gallery': 'Gallery',
      'view_all': 'View All',
      'languages': 'Languages Spoken',
      'lang_staff': 'English, Thai & Chinese',
      // WhatsApp booking translations
      'whatsapp_not_available': 'WhatsApp Not Available',
      'line_not_available': 'Line Not Available',
      'copy_number_message': 'Copy this number to contact us via WhatsApp:',
      'copy_line_id_message': 'Copy this Line ID to contact us via Line:',
      'choose_contact_method': 'Choose Contact Method',
      'via_whatsapp': 'Via WhatsApp',
      'via_line': 'Via Line',
      'cancel': 'Cancel',
      'copy_number': 'Copy Number',
      'copy_line_id': 'Copy Line ID',
      'phone_number_copied': 'Phone number copied to clipboard!',
      'line_id_copied': 'Line ID copied to clipboard!',
      'whatsapp_message': 'Hi, I want to book {roomName}. Is it available?',
      'whatsapp_message_default': 'Hi, I want to book a room. Is it available?',
      // New copy feedback translations
      'address_copied': 'Address copied to clipboard!',
      'phone_copied': 'Phone number copied to clipboard!',
      'email_copied': 'Email copied to clipboard!',
    },
    Language.thai: {
      'hostel_name': 'Stay Strays โฮสเทล',
      'tagline': 'การผจญภัยในกรุงเทพฯ ของคุณเริ่มต้นที่นี่',
      'location': 'หนองแขม กรุงเทพฯ',
      'book_now': 'จองเลย',
      'explore': 'สำรวจ',
      'welcome': 'ยินดีต้อนรับสู่ Stay Strays',
      'welcome_subtitle': 'ความสะดวกสบายสมัยใหม่พบกับเสน่ห์กรุงเทพฯ',
      'welcome_desc': 'ตั้งอยู่ในย่านหนองแขมที่เงียบสงบ Stay Strays โฮสเทลมีห้องครอบครัวที่ทันสมัยพร้อมเครื่องปรับอากาศ ห้องน้ำส่วนตัว และวิวสวนหรือเมืองที่สวยงาม ห้องพักแต่ละห้องมีระเบียง เครื่องซักผ้า และ WiFi ฟรี พักผ่อนในสวน ระเบียง หรือบาร์ของเรา พร้อมด้วยมินิมาร์ทและร้านกาแฟ',
      'rooms': 'ห้องพักของเรา',
      'rooms_subtitle': 'ที่พักสะดวกสบายสำหรับนักเดินทางทุกคน',
      'family_room': 'ห้องครอบครัว',
      'family_features': 'เครื่องปรับอากาศ, ห้องน้ำส่วนตัว, วิวเมือง, ระเบียง',
      'garden_room': 'ห้องวิวสวน',
      'garden_features': 'วิวสวน, เครื่องซักผ้า, WiFi ฟรี, ระเบียง',
      'facilities': 'สิ่งอำนวยความสะดวก',
      'free_wifi': 'WiFi ฟรี',
      'parking': 'ที่จอดรถฟรี',
      'garden': 'สวน & ระเบียง',
      'bar': 'บาร์ & ร้านกาแฟ',
      'minimarket': 'มินิมาร์ท',
      'security': 'รักษาความปลอดภัย 24 ชม.',
      'housekeeping': 'ทำความสะอาดทุกวัน',
      'non_smoking': 'ปลอดบุหรี่',
      'location_title': 'ทำเล',
      'location_subtitle': 'ค้นพบกรุงเทพฯ จาก Stay Strays',
      'nearby': 'สถานที่ท่องเที่ยวใกล้เคียง',
      'wat_arun': 'วัดอรุณ',
      'grand_palace': 'พระบรมมหาราชวัง',
      'floating_market': 'ตลาดน้ำ',
      'reviews': 'รีวิวจากผู้เข้าพัก',
      'contact': 'ติดต่อเรา',
      'address': 'ที่อยู่',
      'address_full': '55/7 เลียบคลองภาษีเจริญฝั่งเหนือซอย 10\nหนองแขม กรุงเทพฯ 10160\nประเทศไทย',
      'phone': 'โทรศัพท์',
      'email': 'อีเมล',
      'check_in': 'เช็คอิน: 14:00 น.',
      'check_out': 'เช็คเอาท์: 07:00 - 12:00 น.',
      'gallery': 'แกลเลอรี',
      'view_all': 'ดูทั้งหมด',
      'languages': 'ภาษาที่ใช้',
      'lang_staff': 'อังกฤษ, ไทย & จีน',
      // WhatsApp booking translations
      'whatsapp_not_available': 'WhatsApp ไม่พร้อมใช้งาน',
      'line_not_available': 'Line ไม่พร้อมใช้งาน',
      'copy_number_message': 'คัดลอกหมายเลขนี้เพื่อติดต่อเราผ่าน WhatsApp:',
      'copy_line_id_message': 'คัดลอก Line ID นี้เพื่อติดต่อเราผ่าน Line:',
      'choose_contact_method': 'เลือกวิธีติดต่อ',
      'via_whatsapp': 'ผ่าน WhatsApp',
      'via_line': 'ผ่าน Line',
      'cancel': 'ยกเลิก',
      'copy_number': 'คัดลอกหมายเลข',
      'copy_line_id': 'คัดลอก Line ID',
      'phone_number_copied': 'คัดลอกหมายเลขโทรศัพท์เรียบร้อยแล้ว!',
      'line_id_copied': 'คัดลอก Line ID เรียบร้อยแล้ว!',
      'whatsapp_message': 'สวัสดี ฉันต้องการจองห้อง {roomName} ห้องนี้ว่างไหม?',
      'whatsapp_message_default': 'สวัสดี ฉันต้องการจองห้องพัก ห้องว่างไหม?',
      // New copy feedback translations
      'address_copied': 'คัดลอกที่อยู่เรียบร้อยแล้ว!',
      'phone_copied': 'คัดลอกหมายเลขโทรศัพท์เรียบร้อยแล้ว!',
      'email_copied': 'คัดลอกอีเมลเรียบร้อยแล้ว!',
    },
    Language.russian: {
      'hostel_name': 'Хостел Stay Strays',
      'tagline': 'Ваше приключение в Бангкоке начинается здесь',
      'location': 'Нонг Кхэм, Бангкок',
      'book_now': 'Забронировать',
      'explore': 'Исследовать',
      'welcome': 'Добро пожаловать в Stay Strays',
      'welcome_subtitle': 'Современный комфорт встречает очарование Бангкока',
      'welcome_desc': 'Расположенный в тихом районе Нонг Кхэм, хостел Stay Strays предлагает современные семейные номера с кондиционером, отдельными ванными комнатами и потрясающим видом на сад или город. В каждом номере есть балкон, стиральная машина и бесплатный WiFi. Отдохните в нашем саду, на террасе или в баре, наслаждаясь нашим мини-маркетом и кофейней.',
      'rooms': 'Наши номера',
      'rooms_subtitle': 'Комфортное проживание для каждого путешественника',
      'family_room': 'Семейный номер',
      'family_features': 'Кондиционер, Отдельная ванная, Вид на город, Балкон',
      'garden_room': 'Номер с видом на сад',
      'garden_features': 'Вид на сад, Стиральная машина, Бесплатный WiFi, Терраса',
      'facilities': 'Удобства',
      'free_wifi': 'Бесплатный WiFi',
      'parking': 'Бесплатная парковка',
      'garden': 'Сад и терраса',
      'bar': 'Бар и кофейня',
      'minimarket': 'Мини-маркет',
      'security': 'Охрана 24/7',
      'housekeeping': 'Ежедневная уборка',
      'non_smoking': 'Для некурящих',
      'location_title': 'Расположение',
      'location_subtitle': 'Откройте для себя Бангкок из Stay Strays',
      'nearby': 'Достопримечательности',
      'wat_arun': 'Ват Арун',
      'grand_palace': 'Большой дворец',
      'floating_market': 'Плавучий рынок',
      'reviews': 'Отзывы гостей',
      'contact': 'Связаться с нами',
      'address': 'Адрес',
      'address_full': '55/7 Liap Khlong Phasi Charoen Fang Nuea 10 Alley\nНонг Кхэм, Бангкок 10160\nТаиланд',
      'phone': 'Телефон',
      'email': 'Эл. почта',
      'check_in': 'Заезд: 14:00',
      'check_out': 'Выезд: 07:00 - 12:00',
      'gallery': 'Галерея',
      'view_all': 'Показать все',
      'languages': 'Языки',
      'lang_staff': 'Английский, Тайский и Китайский',
      // WhatsApp booking translations
      'whatsapp_not_available': 'WhatsApp недоступен',
      'line_not_available': 'Line недоступен',
      'copy_number_message': 'Скопируйте этот номер, чтобы связаться с нами через WhatsApp:',
      'copy_line_id_message': 'Скопируйте этот Line ID, чтобы связаться с нами через Line:',
      'choose_contact_method': 'Выберите способ связи',
      'via_whatsapp': 'Через WhatsApp',
      'via_line': 'Через Line',
      'cancel': 'Отмена',
      'copy_number': 'Скопировать номер',
      'copy_line_id': 'Скопировать Line ID',
      'phone_number_copied': 'Номер телефона скопирован!',
      'line_id_copied': 'Line ID скопирован!',
      'whatsapp_message': 'Привет, я хочу забронировать номер {roomName}. Он доступен?',
      'whatsapp_message_default': 'Привет, я хочу забронировать номер. Он доступен?',
      // New copy feedback translations
      'address_copied': 'Адрес скопирован!',
      'phone_copied': 'Номер телефона скопирован!',
      'email_copied': 'Электронная почта скопирована!',
    },
    Language.chinese: {
      'hostel_name': 'Stay Strays 旅舍',
      'tagline': '您的曼谷冒险从这里开始',
      'location': '农凯区，曼谷',
      'book_now': '立即预订',
      'explore': '探索',
      'welcome': '欢迎来到 Stay Strays',
      'welcome_subtitle': '现代舒适邂逅曼谷魅力',
      'welcome_desc': 'Stay Strays旅舍位于宁静的农凯区，提供现代化的家庭房，配有空调、私人浴室以及美丽的花园或城市景观。每间客房均设有阳台、洗衣机和免费WiFi。在我们的花园、露台或酒吧放松身心，同时享受我们的迷你市场和咖啡店。',
      'rooms': '我们的客房',
      'rooms_subtitle': '为每位旅客提供舒适住宿',
      'family_room': '家庭房',
      'family_features': '空调，私人浴室，城市景观，阳台',
      'garden_room': '花园景观房',
      'garden_features': '花园景观，洗衣机，免费WiFi，露台',
      'facilities': '设施',
      'free_wifi': '免费WiFi',
      'parking': '免费停车',
      'garden': '花园和露台',
      'bar': '酒吧和咖啡店',
      'minimarket': '迷你市场',
      'security': '24小时保安',
      'housekeeping': '每日清洁',
      'non_smoking': '禁烟',
      'location_title': '位置',
      'location_subtitle': '从Stays Strays探索曼谷',
      'nearby': '附近景点',
      'wat_arun': '黎明寺',
      'grand_palace': '大皇宫',
      'floating_market': '水上市场',
      'reviews': '客人评价',
      'contact': '联系我们',
      'address': '地址',
      'address_full': '55/7 Liap Khlong Phasi Charoen Fang Nuea 10 Alley\n农凯区，曼谷 10160\n泰国',
      'phone': '电话',
      'email': '电子邮件',
      'check_in': '入住时间：下午2:00',
      'check_out': '退房时间：上午7:00 - 中午12:00',
      'gallery': '画廊',
      'view_all': '查看全部',
      'languages': '语言',
      'lang_staff': '英语、泰语和中文',
      // WhatsApp booking translations
      'whatsapp_not_available': 'WhatsApp 不可用',
      'line_not_available': 'Line 不可用',
      'copy_number_message': '复制此号码通过 WhatsApp 联系我们：',
      'copy_line_id_message': '复制此 Line ID 通过 Line 联系我们：',
      'choose_contact_method': '选择联系方式',
      'via_whatsapp': '通过 WhatsApp',
      'via_line': '通过 Line',
      'cancel': '取消',
      'copy_number': '复制号码',
      'copy_line_id': '复制 Line ID',
      'phone_number_copied': '电话号码已复制到剪贴板！',
      'line_id_copied': 'Line ID 已复制到剪贴板！',
      'whatsapp_message': '你好，我想预订{roomName}。有空房吗？',
      'whatsapp_message_default': '你好，我想预订一个房间。有空房吗？',
      // New copy feedback translations
      'address_copied': '地址已复制！',
      'phone_copied': '电话号码已复制！',
      'email_copied': '电子邮件已复制！',
    },
  };

  static String get(Language lang, String key) {
    return _translations[lang]?[key] ?? _translations[Language.english]![key]!;
  }
}

// Utility functions for launching URLs
Future<void> commonLaunchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  Language _currentLanguage = Language.english;
  
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
        duration: const Duration(milliseconds: 1000),
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
        content: Text(
          'Language changed',
          style: GoogleFonts.inter(),
        ),
        backgroundColor: const Color(0xFFFF6B35),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  String t(String key) => Translations.get(_currentLanguage, key);

  // Copy to clipboard functionality
  Future<void> copyToClipboard(String value, String label) async {
    await Clipboard.setData(ClipboardData(text: value));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(label),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Show dialog for selecting contact method
  void showBookingMethodDialog({String? roomName}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFFFFBF7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(t('choose_contact_method'), style: _boldText()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF25D366).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.textsms_rounded, color: Color(0xFF25D366)),
              ),
              title: Text(t('via_whatsapp'), style: _boldText()),
              subtitle: Text('+66902587401', style: _normalText()),
              onTap: () {
                Navigator.pop(context);
                _launchWhatsApp(roomName: roomName);
              },
            ),
            const Divider(height: 20),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF00B900).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.message, color: Color(0xFF00B900)),
              ),
              title: Text(t('via_line'), style: _boldText()),
              subtitle: Text('@569omptd', style: _normalText()),
              onTap: () {
                Navigator.pop(context);
                _launchLine();
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t('cancel'), style: _interText(color: const Color(0xFF666666))),
          ),
        ],
      ),
    );
  }

  // Launch WhatsApp
  void _launchWhatsApp({String? roomName}) async {
    const phone = '+66902587401';
    final message = roomName != null 
        ? t('whatsapp_message').replaceAll('{roomName}', roomName)
        : t('whatsapp_message_default');
    final url = 'whatsapp://send?phone=$phone&text=${Uri.encodeComponent(message)}';
    
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      _showCopyDialog(phone, 'whatsapp');
    }
  }

  // Launch Line
  void _launchLine() async {
    const lineId = '@569omptd';
    const lineUrl = 'https://line.me/R/ti/p/@569omptd';
    const lineAppUrl = 'line://ti/p/@569omptd';
    
    // Try to open Line app first
    if (await canLaunchUrl(Uri.parse(lineAppUrl))) {
      await launchUrl(Uri.parse(lineAppUrl));
    } 
    // If Line app is not installed, try to open in browser
    else if (await canLaunchUrl(Uri.parse(lineUrl))) {
      await launchUrl(Uri.parse(lineUrl));
    } else {
      _showCopyDialog(lineId, 'line');
    }
  }

  // Show copy dialog when app is not available
  void _showCopyDialog(String contact, String type) {
    final isWhatsApp = type == 'whatsapp';
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFFFFBF7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(isWhatsApp ? t('whatsapp_not_available') : t('line_not_available'), 
            style: _boldText()),
        content: Text(
          isWhatsApp ? 
            '${t('copy_number_message')}\n\n$contact' :
            '${t('copy_line_id_message')}\n\n$contact', 
          style: _normalText()
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t('cancel'), style: _interText(color: const Color(0xFF666666))),
          ),
          TextButton(
            onPressed: () {
              final label = isWhatsApp ? t('phone_number_copied') : t('line_id_copied');
              copyToClipboard(contact, label);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              backgroundColor: const Color(0xFFFF6B35),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
            child: Text(
              isWhatsApp ? t('copy_number') : t('copy_line_id'), 
              style: _boldText(color: Colors.white)
            ),
          ),
        ],
      ),
    );
  }

  // Helper styles
  TextStyle _boldText({Color color = const Color(0xFF2C2C2C)}) => 
    GoogleFonts.inter(fontWeight: FontWeight.bold, color: color);

  TextStyle _normalText({Color color = const Color(0xFF555555)}) => 
    GoogleFonts.inter(color: color);

  TextStyle _interText({Color color = Colors.black}) => 
    GoogleFonts.inter(color: color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(key: _homeKey, t: t, onBookNowPressed: () {
                  _scrollToSection(_roomsKey);
                  // showBookingMethodDialog();
                }),
                WelcomeSection(t: t),
                RoomsSection(key: _roomsKey, t: t, onBookNowPressed: showBookingMethodDialog),
                FacilitiesSection(key: _facilitiesKey, t: t),
                GallerySection(key: _galleryKey, t: t),
                LocationSection(key: _locationKey, t: t),
                ReviewsSection(key: _reviewsKey, t: t),
                ContactSection(key: _contactKey, t: t),
                FooterSection(
                  t: t,
                  onInstagramTap: () => commonLaunchUrl('https://www.instagram.com/stay_strays_hostel'),
                  onTiktokTap: () => commonLaunchUrl('https://www.tiktok.com/@stay.strays.bangkok'),
                  onFacebookTap: () => commonLaunchUrl('https://www.facebook.com/people/Stay-Strays-Hostel/61574424366581/'),
                  onGoogleMapsTap: () => commonLaunchUrl('https://maps.app.goo.gl/P3qhzu7ivXMw7wxX7'),
                  onLinktreeTap: () => commonLaunchUrl('https://linktr.ee/staystrayshostel?utm_source=linktree_profile_share&ltsid=fc4d4bc7-3135-4823-a236-f76bf10bc954'),
                ),
              ],
            ),
          ),
          ModernNavBar(
            onHomePressed: () => _scrollToSection(_homeKey),
            onRoomsPressed: () => _scrollToSection(_roomsKey),
            onFacilitiesPressed: () => _scrollToSection(_facilitiesKey),
            onGalleryPressed: () => _scrollToSection(_galleryKey),
            onLocationPressed: () => _scrollToSection(_locationKey),
            onReviewsPressed: () => _scrollToSection(_reviewsKey),
            onContactPressed: () => _scrollToSection(_contactKey),
            onBookNowPressed: () => _scrollToSection(_roomsKey),
            // onBookNowPressed: () {
            //   showBookingMethodDialog();
            // },
            currentLanguage: _currentLanguage,
            onLanguageChanged: _changeLanguage,
            t: t,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    final isMobile = MediaQuery.of(context).size.width < 768;
    if (!isMobile) return const SizedBox.shrink();

    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFF6B35), Color(0xFFFF8C61)],
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 40),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/staystrays/staystrayslogo.png',
                  height: isMobile ? 60 : 100,  
                fit: BoxFit.cover, // Ensures the image fills the clipping area
                ),
              ),
  ],
),
              Text(
                t('hostel_name'),
                textAlign: TextAlign.center,
                style: GoogleFonts.righteous(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              _drawerItem(Icons.home, t('welcome').split(' ')[0], () {
                Navigator.pop(context);
                _scrollToSection(_homeKey);
              }),
              _drawerItem(Icons.bed, t('rooms'), () {
                Navigator.pop(context);
                _scrollToSection(_roomsKey);
              }),
              _drawerItem(Icons.spa, t('facilities'), () {
                Navigator.pop(context);
                _scrollToSection(_facilitiesKey);
              }),
              _drawerItem(Icons.photo_library, t('gallery'), () {
                Navigator.pop(context);
                _scrollToSection(_galleryKey);
              }),
              _drawerItem(Icons.location_on, t('location_title'), () {
                Navigator.pop(context);
                _scrollToSection(_locationKey);
              }),
              _drawerItem(Icons.star, t('reviews'), () {
                Navigator.pop(context);
                _scrollToSection(_reviewsKey);
              }),
              _drawerItem(Icons.phone, t('contact'), () {
                Navigator.pop(context);
                _scrollToSection(_contactKey);
              }),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: PulseButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // showBookingMethodDialog();
_scrollToSection(_roomsKey);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        t('book_now'),
                        style: GoogleFonts.inter(
                          color: const Color(0xFFFF6B35),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}

// Modern Navigation Bar
class ModernNavBar extends StatefulWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onRoomsPressed;
  final VoidCallback onFacilitiesPressed;
  final VoidCallback onGalleryPressed;
  final VoidCallback onLocationPressed;
  final VoidCallback onReviewsPressed;
  final VoidCallback onContactPressed;
  final VoidCallback onBookNowPressed;
  final Language currentLanguage;
  final Function(Language) onLanguageChanged;
  final String Function(String) t;

  const ModernNavBar({
    Key? key,
    required this.onHomePressed,
    required this.onRoomsPressed,
    required this.onFacilitiesPressed,
    required this.onGalleryPressed,
    required this.onLocationPressed,
    required this.onReviewsPressed,
    required this.onContactPressed,
    required this.onBookNowPressed,
    required this.currentLanguage,
    required this.onLanguageChanged,
    required this.t,
  }) : super(key: key);

  @override
  State<ModernNavBar> createState() => _ModernNavBarState();
}

class _ModernNavBarState extends State<ModernNavBar> {
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
        height: isMobile ? 70 : 80,
        decoration: BoxDecoration(
          gradient: _isScrolled
              ? const LinearGradient(
                  colors: [Color(0xFFFF6B35), Color(0xFFFF8C61)],
                )
              : LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
          boxShadow: _isScrolled
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 5),
                  )
                ]
              : [],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 48),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PulseButton(
                onPressed: widget.onHomePressed,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(5),
                      child: Image.asset(
                        'assets/staystrays/staystrayslogo.png',
                        height: isMobile ? 28 : 50,
                      ),
                    ),
                    SizedBox(width: isMobile ? 8 : 12),
                    Text(
                      widget.t('hostel_name'),
                      style: GoogleFonts.righteous(
                        fontSize: isMobile ? 20 : 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isMobile) ...[
                Row(
                  children: [
                    _buildLanguageSelector(),
                    const SizedBox(width: 24),
                    PulseButton(
                      onPressed: widget.onBookNowPressed,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Text(
                          widget.t('book_now'),
                          style: GoogleFonts.inter(
                            color: const Color(0xFFFF6B35),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ] else ...[
                Row(
                  children: [
                    _buildLanguageSelector(),
                    const SizedBox(width: 8),
                    Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(
                          Icons.menu_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageSelector() {
    return PopupMenuButton<Language>(
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.language, color: Colors.white, size: 20),
            const SizedBox(width: 4),
            Text(
              _getLanguageCode(widget.currentLanguage),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      onSelected: widget.onLanguageChanged,
      itemBuilder: (context) => [
        _buildLanguageItem(Language.english, '🇬🇧', 'English'),
        _buildLanguageItem(Language.thai, '🇹🇭', 'ไทย'),
        _buildLanguageItem(Language.russian, '🇷🇺', 'Русский'),
        _buildLanguageItem(Language.chinese, '🇨🇳', '中文'),
      ],
    );
  }

  PopupMenuItem<Language> _buildLanguageItem(
    Language lang,
    String flag,
    String name,
  ) {
    final isSelected = widget.currentLanguage == lang;
    return PopupMenuItem<Language>(
      value: lang,
      child: Row(
        children: [
          Text(flag, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Text(
            name,
            style: GoogleFonts.inter(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? const Color(0xFFFF6B35) : Colors.black87,
            ),
          ),
          if (isSelected) ...[
            const Spacer(),
            const Icon(Icons.check, color: Color(0xFFFF6B35), size: 20),
          ],
        ],
      ),
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
}

// Pulse Button Widget
class PulseButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;

  const PulseButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<PulseButton> createState() => _PulseButtonState();
}

class _PulseButtonState extends State<PulseButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.92).animate(
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
  final String Function(String) t;
  final VoidCallback onBookNowPressed;

  const HeroSection({
    Key? key, 
    required this.t,
    required this.onBookNowPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const NetworkImage(
            'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=1920',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              const Color(0xFFFF6B35).withOpacity(0.3),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SlideInAnimation(
                  delay: 0,
                  direction: SlideDirection.down,
                  child: InkWell(
                    onTap: (){
                      commonLaunchUrl('https://maps.app.goo.gl/P3qhzu7ivXMw7wxX7');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF6B35),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.location_on, color: Colors.white, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            t('location'),
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                              
                SlideInAnimation(
                  delay: 200,
                  direction: SlideDirection.up,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(5),
                    child: Image.asset(
                      'assets/staystrays/staystrayslogo.png',
                      height: isMobile ? 60 : 100,  
                    ),
                  ),
                ),
                SlideInAnimation(
                  delay: 200,
                  direction: SlideDirection.up,
                  child: Text(
                    t('hostel_name'),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.righteous(
                      fontSize: isMobile ? 48 : 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.1,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SlideInAnimation(
                  delay: 400,
                  direction: SlideDirection.up,
                  child: Text(
                    t('tagline'),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 18 : 26,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                SlideInAnimation(
                  delay: 600,
                  direction: SlideDirection.up,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PulseButton(
                        onPressed: onBookNowPressed,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 32 : 48,
                            vertical: isMobile ? 18 : 24,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFF6B35), Color(0xFFFF8C61)],
                            ),
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFFF6B35).withOpacity(0.5),
                                blurRadius: 30,
                                offset: const Offset(0, 15),
                              ),
                            ],
                          ),
                          child: Text(
                            t('book_now'),
                            style: GoogleFonts.inter(
                              fontSize: isMobile ? 16 : 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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
      ),
    );
  }
}

// Slide In Animation Widget
enum SlideDirection { up, down, left, right }

class SlideInAnimation extends StatefulWidget {
  final Widget child;
  final int delay;
  final SlideDirection direction;

  const SlideInAnimation({
    Key? key,
    required this.child,
    this.delay = 0,
    this.direction = SlideDirection.up,
  }) : super(key: key);

  @override
  State<SlideInAnimation> createState() => _SlideInAnimationState();
}

class _SlideInAnimationState extends State<SlideInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    Offset begin;
    switch (widget.direction) {
      case SlideDirection.up:
        begin = const Offset(0, 0.5);
        break;
      case SlideDirection.down:
        begin = const Offset(0, -0.5);
        break;
      case SlideDirection.left:
        begin = const Offset(0.5, 0);
        break;
      case SlideDirection.right:
        begin = const Offset(-0.5, 0);
        break;
    }

    _slideAnimation = Tween<Offset>(
      begin: begin,
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

// Welcome Section
class WelcomeSection extends StatelessWidget {
  final String Function(String) t;

  const WelcomeSection({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFFFBF7), Color(0xFFFFF5EE)],
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFFF6B35).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              t('welcome').toUpperCase(),
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFF6B35),
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            t('welcome_subtitle'),
            textAlign: TextAlign.center,
            style: GoogleFonts.righteous(
              fontSize: isMobile ? 28 : 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C2C2C),
            ),
          ),
          const SizedBox(height: 32),
          Container(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Text(
              t('welcome_desc'),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: isMobile ? 15 : 18,
                height: 1.8,
                color: const Color(0xFF555555),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Rooms Section
class RoomsSection extends StatelessWidget {
  final String Function(String) t;
  final Function({String? roomName}) onBookNowPressed;

  const RoomsSection({
    Key? key, 
    required this.t,
    required this.onBookNowPressed,
  }) : super(key: key);

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
            t('rooms'),
            textAlign: TextAlign.center,
            style: GoogleFonts.righteous(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C2C2C),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            t('rooms_subtitle'),
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
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
      children: [
        ModernRoomCard(
          title: t('family_room'),
          features: t('family_features'),
          image: 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=600',
          t: t,
          onBookNowPressed: () => onBookNowPressed(roomName: t('family_room')),
        ),
        const SizedBox(height: 24),
        ModernRoomCard(
          title: t('garden_room'),
          features: t('garden_features'),
          image: 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=600',
          t: t,
          onBookNowPressed: () => onBookNowPressed(roomName: t('garden_room')),
        ),
      ],
    );
  }

  Widget _buildDesktopRooms() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ModernRoomCard(
          title: t('family_room'),
          features: t('family_features'),
          image: 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=600',
          t: t,
          onBookNowPressed: () => onBookNowPressed(roomName: t('family_room')),
        ),
        const SizedBox(width: 32),
        ModernRoomCard(
          title: t('garden_room'),
          features: t('garden_features'),
          image: 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=600',
          t: t,
          onBookNowPressed: () => onBookNowPressed(roomName: t('garden_room')),
        ),
      ],
    );
  }
}

class ModernRoomCard extends StatefulWidget {
  final String title;
  final String features;
  final String image;
  final String Function(String) t;
  final VoidCallback onBookNowPressed;

  const ModernRoomCard({
    Key? key,
    required this.title,
    required this.features,
    required this.image,
    required this.t,
    required this.onBookNowPressed,
  }) : super(key: key);

  @override
  State<ModernRoomCard> createState() => _ModernRoomCardState();
}

class _ModernRoomCardState extends State<ModernRoomCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
        width: 400,
        transform: Matrix4.identity()
          ..rotateZ(_isHovered ? -0.01 : 0)
          ..scale(_isHovered ? 1.05 : 1.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFF6B35).withOpacity(_isHovered ? 0.4 : 0.2),
              blurRadius: _isHovered ? 40 : 20,
              offset: Offset(0, _isHovered ? 20 : 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            children: [
              Image.network(
                widget.image,
                height: 500,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.righteous(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.features,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.9),
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 24),
                      PulseButton(
                        onPressed: widget.onBookNowPressed,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF6B35),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                widget.t('book_now'),
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Facilities Section  
class FacilitiesSection extends StatelessWidget {
  final String Function(String) t;

  const FacilitiesSection({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFFFBF7), Color(0xFFFFF5EE)],
        ),
      ),
      child: Column(
        children: [
          Text(
            t('facilities'),
            textAlign: TextAlign.center,
            style: GoogleFonts.righteous(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C2C2C),
            ),
          ),
          const SizedBox(height: 56),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _buildFacility(Icons.wifi, t('free_wifi')),
              _buildFacility(Icons.local_parking, t('parking')),
              _buildFacility(Icons.yard, t('garden')),
              _buildFacility(Icons.local_bar, t('bar')),
              _buildFacility(Icons.store, t('minimarket')),
              _buildFacility(Icons.security, t('security')),
              _buildFacility(Icons.cleaning_services, t('housekeeping')),
              _buildFacility(Icons.smoke_free, t('non_smoking')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFacility(IconData icon, String text) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF6B35).withOpacity(0.1),
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
                colors: [Color(0xFFFF6B35), Color(0xFFFF8C61)],
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 32, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2C2C2C),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Gallery Section
class GallerySection extends StatelessWidget {
  final String Function(String) t;

  const GallerySection({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    final images = [
      'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=600',
      'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=600',
      'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=600',
      'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=600',
      'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=600',
      'https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=600',
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: [
          Text(
            t('gallery'),
            textAlign: TextAlign.center,
            style: GoogleFonts.righteous(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C2C2C),
            ),
          ),
          const SizedBox(height: 56),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 2 : 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          const SizedBox(height: 48),
          PulseButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(t('view_all'), style: GoogleFonts.inter()),
                  backgroundColor: const Color(0xFFFF6B35),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF6B35), Color(0xFFFF8C61)],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                t('view_all'),
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Location Section
class LocationSection extends StatelessWidget {
  final String Function(String) t;

  const LocationSection({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFFFBF7), Color(0xFFFFF5EE)],
        ),
      ),
      child: Column(
        children: [
          Text(
            t('location_title'),
            textAlign: TextAlign.center,
            style: GoogleFonts.righteous(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C2C2C),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            t('location_subtitle'),
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
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
              _buildNearby(t('wat_arun'), '12 mi', Icons.temple_buddhist),
              _buildNearby(t('grand_palace'), '13 mi', Icons.castle),
              _buildNearby(t('floating_market'), '17.5 km', Icons.shopping_bag),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNearby(String name, String distance, IconData icon) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF6B35).withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: const Color(0xFFFF6B35)),
          const SizedBox(height: 16),
          Text(
            name,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C2C2C),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            distance,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: const Color(0xFF666666),
            ),
          ),
        ],
      ),
    );
  }
}

// Reviews Section
class ReviewsSection extends StatelessWidget {
  final String Function(String) t;

  const ReviewsSection({Key? key, required this.t}) : super(key: key);

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
            t('reviews'),
            textAlign: TextAlign.center,
            style: GoogleFonts.righteous(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C2C2C),
            ),
          ),
          const SizedBox(height: 56),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: const [
              ReviewCard(
                name: 'Anna Smith',
                rating: 5,
                review: 'Amazing hostel! The garden view is beautiful and staff are very helpful. Highly recommend!',
              ),
              ReviewCard(
                name: 'Chen Wei',
                rating: 5,
                review: '很棒的旅舍！房间干净，工作人员友好。位置也很好。',
              ),
              ReviewCard(
                name: 'Dmitri Ivanov',
                rating: 4,
                review: 'Отличное место для бюджетного отдыха. Чистые номера и хорошие удобства.',
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

  const ReviewCard({
    Key? key,
    required this.name,
    required this.rating,
    required this.review,
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
            color: const Color(0xFFFF6B35).withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF6B35), Color(0xFFFF8C61)],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    name[0],
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  name,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
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
                color: const Color(0xFFFFB800),
                size: 20,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            review,
            style: GoogleFonts.inter(
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
  final String Function(String) t;

  const ContactSection({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFFFBF7), Color(0xFFFFF5EE)],
        ),
      ),
      child: Column(
        children: [
          Text(
            t('contact'),
            textAlign: TextAlign.center,
            style: GoogleFonts.righteous(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C2C2C),
            ),
          ),
          const SizedBox(height: 56),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  commonLaunchUrl('https://maps.app.goo.gl/P3qhzu7ivXMw7wxX7');
                },
                onLongPress: () {
                  // copy the address to clipboard
                  Clipboard.setData(ClipboardData(text: t('address_full')));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(t('address_copied')),
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: _buildContactCard(
                  Icons.location_on,
                  t('address'),
                  t('address_full'),
                ),
              ),
              InkWell(
                onTap: kIsWeb ? null: () {
                  commonLaunchUrl('tel:+66902587401');                  
                },                
                onLongPress: () {
                  // copy the phone number to clipboard
                  Clipboard.setData(ClipboardData(text: "+66902587401"));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(t('phone_copied')),
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: _buildContactCard(
                  Icons.phone,
                  t('phone'),
                  '+66902587401', // Updated phone number
                ),
              ),
                            InkWell(
                onTap: () {
                  commonLaunchUrl('mailto:info@staystrayshostel.com?subject=Stay Strays Hostel Inquiry');                  
                },
                onLongPress: () {
                  // copy the email to clipboard
                  Clipboard.setData(ClipboardData(text: "info@staystrayshostel.com"));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(t('email_copied')),
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: _buildContactCard(
                  Icons.email,
                  t('email'),
                  'info@staystrayshostel.com',
                ),
              ),
            ],
          ),
          const SizedBox(height: 48),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFFF6B35).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  t('check_in'),
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: const Color(0xFF2C2C2C),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  t('check_out'),
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: const Color(0xFF2C2C2C),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(IconData icon, String title, String info) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF6B35).withOpacity(0.1),
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
                colors: [Color(0xFFFF6B35), Color(0xFFFF8C61)],
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 32, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C2C2C),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            info,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
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

// Footer Section
class FooterSection extends StatelessWidget {
  final String Function(String) t;
  final VoidCallback onInstagramTap;
  final VoidCallback onTiktokTap;
  final VoidCallback onFacebookTap;
  final VoidCallback onGoogleMapsTap;
  final VoidCallback onLinktreeTap;

  const FooterSection({
    Key? key,
    required this.t,
    required this.onInstagramTap,
    required this.onTiktokTap,
    required this.onFacebookTap,
    required this.onGoogleMapsTap,
    required this.onLinktreeTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.all(isMobile ? 32 : 48),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2C2C2C), Color(0xFF1A1A1A)],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(Icons.photo_camera, onInstagramTap),
              const SizedBox(width: 16),
              _buildSocialIcon(Icons.music_note, onTiktokTap),
              const SizedBox(width: 16),
              _buildSocialIcon(Icons.facebook, onFacebookTap),
              const SizedBox(width: 16),
              _buildSocialIcon(Icons.map, onGoogleMapsTap),
              const SizedBox(width: 16),
              _buildSocialIcon(Icons.link, onLinktreeTap),
            ],
          ),
          const SizedBox(height: 32),
          Divider(color: Colors.white.withOpacity(0.2)),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(5),
            child: Image.asset(
              'assets/staystrays/staystrayslogo.png',
              height: isMobile ? 60 : 100,  
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '© 2025 Stay Strays Hostel Bangkok. All rights reserved.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.white70,
              fontSize: isMobile ? 12 : 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, VoidCallback onTap) {
    return PulseButton(
      onPressed: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFF6B35), Color(0xFFFF8C61)],
          ),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}