// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:url_launcher/url_launcher.dart';

// class P29HostelApp extends StatelessWidget {
//   const P29HostelApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'P29 Hostel Bangkok',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: const Color(0xFF0A2463),
//         scaffoldBackgroundColor: const Color(0xFFF8F9FA),
//         textTheme: GoogleFonts.poppinsTextTheme(),
//       ),
//       home: const LandingPage(),
//     );
//   }
// }

// // Language Model
// enum Language { english, thai, russian, chinese }

// class Translations {
//   static final Map<Language, Map<String, String>> _translations = {
//     Language.english: {
//       'hostel_name': 'P29 Hostel',
//       'tagline': 'Modern Comfort in Bangkok',
//       'subtitle': 'Your peaceful retreat in the heart of Bangkok',
//       'location': 'Nong Khaem, Bangkok',
//       'book_now': 'Book Your Stay',
//       'explore': 'Explore',
//       'welcome': 'Welcome to P29',
//       'welcome_subtitle': 'Where modern design meets Thai hospitality',
//       'welcome_desc':
//           'Discover P29 Hostel in the peaceful Nong Khaem district of Bangkok. Our contemporary family rooms feature air-conditioning, private bathrooms, and beautiful garden or city views. Every room includes a private balcony, washing machine, and complimentary WiFi. Unwind in our serene garden, spacious terrace, or vibrant bar while enjoying our on-site minimarket and artisan coffee shop.',
//       'rooms': 'Accommodation',
//       'rooms_subtitle': 'Designed for your comfort',
//       'family_room': 'Family Room',
//       'family_features':
//           'Air-conditioning • Private bathroom • City view • Balcony',
//       'garden_room': 'Garden View Room',
//       'garden_features': 'Garden view • Washing machine • Free WiFi • Terrace',
//       'deluxe_room': 'Deluxe Room',
//       'deluxe_features':
//           'Premium bedding • Smart TV • Mini fridge • Work desk',
//       'facilities': 'Amenities',
//       'facilities_subtitle': 'Everything you need',
//       'free_wifi': 'High-Speed WiFi',
//       'parking': 'Free Parking',
//       'garden': 'Garden & Terrace',
//       'bar': 'Bar & Coffee Shop',
//       'minimarket': 'Mini Market',
//       'security': '24/7 Security',
//       'housekeeping': 'Daily Housekeeping',
//       'non_smoking': 'Non-Smoking',
//       'safe': 'Safety Deposit',
//       'express_checkin': 'Express Check-in',
//       'location_title': 'Location',
//       'location_subtitle': 'Perfectly positioned in Bangkok',
//       'nearby': 'Nearby Attractions',
//       'wat_arun': 'Wat Arun - 12 mi',
//       'grand_palace': 'Grand Palace - 13 mi',
//       'floating_market': 'Floating Market - 8 mi',
//       'paradise_park': 'Paradise Park - 3.7 mi',
//       'reviews': 'Guest Reviews',
//       'contact': 'Get in Touch',
//       'address': 'Address',
//       'address_full':
//           '55/7 Liap Khlong Phasi Charoen\nFang Nuea 10 Alley, Nong Khaem\nBangkok 10160, Thailand',
//       'phone': 'Phone',
//       'email': 'Email',
//       'check_in': 'Check-in: 2:00 PM',
//       'check_out': 'Check-out: 7:00 AM - 12:00 PM',
//       'gallery': 'Gallery',
//       'view_all': 'View All Photos',
//       'languages': 'Languages',
//       'lang_staff': 'English • Thai • Chinese',
//       'why_choose': 'Why Choose P29',
//       'why_subtitle': 'Experience the difference',
//       'modern_design': 'Modern Design',
//       'modern_desc': 'Contemporary interiors with Thai touches',
//       'prime_location': 'Prime Location',
//       'prime_desc': 'Easy access to Bangkok attractions',
//       'comfort': 'Ultimate Comfort',
//       'comfort_desc': 'Premium amenities for a relaxing stay',
//       // Booking translations
//       'whatsapp_not_available': 'WhatsApp Not Available',
//       'line_not_available': 'Line Not Available',
//       'copy_number_message': 'Copy this number to contact via WhatsApp:',
//       'copy_line_id_message': 'Copy this Line ID to contact via Line:',
//       'choose_contact_method': 'Choose Contact Method',
//       'via_whatsapp': 'Via WhatsApp',
//       'via_line': 'Via Line',
//       'cancel': 'Cancel',
//       'copy_number': 'Copy Number',
//       'copy_line_id': 'Copy Line ID',
//       'phone_number_copied': 'Phone number copied!',
//       'line_id_copied': 'Line ID copied!',
//       'whatsapp_message': 'Hi, I want to book {roomName}. Is it available?',
//       'whatsapp_message_default': 'Hi, I want to book a room at P29 Hostel.',
//       'address_copied': 'Address copied!',
//       'phone_copied': 'Phone number copied!',
//       'email_copied': 'Email copied!',
//     },
//     Language.thai: {
//       'hostel_name': 'P29 โฮสเทล',
//       'tagline': 'ความสะดวกสบายสมัยใหม่ในกรุงเทพฯ',
//       'subtitle': 'ที่พักสงบของคุณในใจกลางกรุงเทพฯ',
//       'location': 'หนองแขม, กรุงเทพฯ',
//       'book_now': 'จองที่พัก',
//       'explore': 'สำรวจ',
//       'welcome': 'ยินดีต้อนรับสู่ P29',
//       'welcome_subtitle': 'ที่ซึ่งการออกแบบสมัยใหม่พบกับการต้อนรับแบบไทย',
//       'welcome_desc':
//           'ค้นพบ P29 โฮสเทลในย่านหนองแขมที่เงียบสงบของกรุงเทพฯ ห้องครอบครัวร่วมสมัยของเรามีเครื่องปรับอากาศ ห้องน้ำส่วนตัว และวิวสวนหรือเมืองที่สวยงาม ทุกห้องมีระเบียงส่วนตัว เครื่องซักผ้า และ WiFi ฟรี พักผ่อนในสวนที่เงียบสงบ ระเบียงกว้างขวาง หรือบาร์ที่มีชีวิตชีวา พร้อมด้วยมินิมาร์ทและร้านกาแฟคุณภาพสูง',
//       'rooms': 'ที่พัก',
//       'rooms_subtitle': 'ออกแบบเพื่อความสะดวกสบายของคุณ',
//       'family_room': 'ห้องครอบครัว',
//       'family_features': 'เครื่องปรับอากาศ • ห้องน้ำส่วนตัว • วิวเมือง • ระเบียง',
//       'garden_room': 'ห้องวิวสวน',
//       'garden_features': 'วิวสวน • เครื่องซักผ้า • WiFi ฟรี • ระเบียง',
//       'deluxe_room': 'ห้องดีลักซ์',
//       'deluxe_features': 'ที่นอนพรีเมียม • สมาร์ททีวี • ตู้เย็นมินิ • โต๊ะทำงาน',
//       'facilities': 'สิ่งอำนวยความสะดวก',
//       'facilities_subtitle': 'ทุกสิ่งที่คุณต้องการ',
//       'free_wifi': 'WiFi ความเร็วสูง',
//       'parking': 'ที่จอดรถฟรี',
//       'garden': 'สวน & ระเบียง',
//       'bar': 'บาร์ & ร้านกาแฟ',
//       'minimarket': 'มินิมาร์ท',
//       'security': 'รักษาความปลอดภัย 24/7',
//       'housekeeping': 'ทำความสะอาดทุกวัน',
//       'non_smoking': 'ปลอดบุหรี่',
//       'safe': 'ตู้นิรภัย',
//       'express_checkin': 'เช็คอินด่วน',
//       'location_title': 'ทำเล',
//       'location_subtitle': 'ตำแหน่งที่สมบูรณ์แบบในกรุงเทพฯ',
//       'nearby': 'สถานที่ท่องเที่ยวใกล้เคียง',
//       'wat_arun': 'วัดอรุณ - 12 ไมล์',
//       'grand_palace': 'พระบรมมหาราชวัง - 13 ไมล์',
//       'floating_market': 'ตลาดน้ำ - 8 ไมล์',
//       'paradise_park': 'พาราไดซ์ พาร์ค - 3.7 ไมล์',
//       'reviews': 'รีวิวจากผู้เข้าพัก',
//       'contact': 'ติดต่อเรา',
//       'address': 'ที่อยู่',
//       'address_full':
//           '55/7 เลียบคลองภาษีเจริญ\nฝั่งเหนือซอย 10 หนองแขม\nกรุงเทพฯ 10160 ประเทศไทย',
//       'phone': 'โทรศัพท์',
//       'email': 'อีเมล',
//       'check_in': 'เช็คอิน: 14:00 น.',
//       'check_out': 'เช็คเอาท์: 07:00 - 12:00 น.',
//       'gallery': 'แกลเลอรี',
//       'view_all': 'ดูรูปภาพทั้งหมด',
//       'languages': 'ภาษา',
//       'lang_staff': 'อังกฤษ • ไทย • จีน',
//       'why_choose': 'ทำไมต้องเลือก P29',
//       'why_subtitle': 'สัมผัสความแตกต่าง',
//       'modern_design': 'การออกแบบสมัยใหม่',
//       'modern_desc': 'การตกแต่งร่วมสมัยผสมสัมผัสไทย',
//       'prime_location': 'ทำเลยอดเยี่ยม',
//       'prime_desc': 'เข้าถึงสถานที่ท่องเที่ยวกรุงเทพฯ ได้ง่าย',
//       'comfort': 'ความสะดวกสบายสูงสุด',
//       'comfort_desc': 'สิ่งอำนวยความสะดวกพรีเมียมเพื่อการพักผ่อน',
//       'whatsapp_not_available': 'WhatsApp ไม่พร้อมใช้งาน',
//       'line_not_available': 'Line ไม่พร้อมใช้งาน',
//       'copy_number_message': 'คัดลอกหมายเลขนี้เพื่อติดต่อผ่าน WhatsApp:',
//       'copy_line_id_message': 'คัดลอก Line ID นี้เพื่อติดต่อผ่าน Line:',
//       'choose_contact_method': 'เลือกวิธีติดต่อ',
//       'via_whatsapp': 'ผ่าน WhatsApp',
//       'via_line': 'ผ่าน Line',
//       'cancel': 'ยกเลิก',
//       'copy_number': 'คัดลอกหมายเลข',
//       'copy_line_id': 'คัดลอก Line ID',
//       'phone_number_copied': 'คัดลอกหมายเลขโทรศัพท์แล้ว!',
//       'line_id_copied': 'คัดลอก Line ID แล้ว!',
//       'whatsapp_message': 'สวัสดี ฉันต้องการจองห้อง {roomName} ว่างไหม?',
//       'whatsapp_message_default': 'สวัสดี ฉันต้องการจองห้องที่ P29 โฮสเทล',
//       'address_copied': 'คัดลอกที่อยู่แล้ว!',
//       'phone_copied': 'คัดลอกหมายเลขโทรศัพท์แล้ว!',
//       'email_copied': 'คัดลอกอีเมลแล้ว!',
//     },
//     Language.russian: {
//       'hostel_name': 'Хостел P29',
//       'tagline': 'Современный комфорт в Бангкоке',
//       'subtitle': 'Ваше спокойное убежище в сердце Бангкока',
//       'location': 'Нонг Кхэм, Бангкок',
//       'book_now': 'Забронировать',
//       'explore': 'Исследовать',
//       'welcome': 'Добро пожаловать в P29',
//       'welcome_subtitle': 'Где современный дизайн встречает тайское гостеприимство',
//       'welcome_desc':
//           'Откройте для себя хостел P29 в тихом районе Нонг Кхэм в Бангкоке. Наши современные семейные номера оснащены кондиционером, отдельными ванными комнатами и прекрасным видом на сад или город. В каждом номере есть собственный балкон, стиральная машина и бесплатный WiFi. Расслабьтесь в нашем тихом саду, просторной террасе или оживленном баре, наслаждаясь нашим мини-маркетом и ремесленной кофейней.',
//       'rooms': 'Размещение',
//       'rooms_subtitle': 'Разработано для вашего комфорта',
//       'family_room': 'Семейный номер',
//       'family_features':
//           'Кондиционер • Отдельная ванная • Вид на город • Балкон',
//       'garden_room': 'Номер с видом на сад',
//       'garden_features':
//           'Вид на сад • Стиральная машина • Бесплатный WiFi • Терраса',
//       'deluxe_room': 'Номер делюкс',
//       'deluxe_features':
//           'Премиальное постельное белье • Смарт ТВ • Мини-холодильник • Рабочий стол',
//       'facilities': 'Удобства',
//       'facilities_subtitle': 'Все, что вам нужно',
//       'free_wifi': 'Высокоскоростной WiFi',
//       'parking': 'Бесплатная парковка',
//       'garden': 'Сад и терраса',
//       'bar': 'Бар и кофейня',
//       'minimarket': 'Мини-маркет',
//       'security': 'Охрана 24/7',
//       'housekeeping': 'Ежедневная уборка',
//       'non_smoking': 'Для некурящих',
//       'safe': 'Сейф',
//       'express_checkin': 'Быстрая регистрация',
//       'location_title': 'Расположение',
//       'location_subtitle': 'Идеально расположен в Бангкоке',
//       'nearby': 'Достопримечательности поблизости',
//       'wat_arun': 'Ват Арун - 12 миль',
//       'grand_palace': 'Большой дворец - 13 миль',
//       'floating_market': 'Плавучий рынок - 8 миль',
//       'paradise_park': 'Парадайз Парк - 3.7 миль',
//       'reviews': 'Отзывы гостей',
//       'contact': 'Свяжитесь с нами',
//       'address': 'Адрес',
//       'address_full':
//           '55/7 Лиап Клонг Пхаси Чароен\nФанг Нуеа 10 Аллея, Нонг Кхэм\nБангкок 10160, Таиланд',
//       'phone': 'Телефон',
//       'email': 'Email',
//       'check_in': 'Заезд: 14:00',
//       'check_out': 'Выезд: 07:00 - 12:00',
//       'gallery': 'Галерея',
//       'view_all': 'Все фото',
//       'languages': 'Языки',
//       'lang_staff': 'Английский • Тайский • Китайский',
//       'why_choose': 'Почему P29',
//       'why_subtitle': 'Почувствуйте разницу',
//       'modern_design': 'Современный дизайн',
//       'modern_desc': 'Современный интерьер с тайскими элементами',
//       'prime_location': 'Отличное расположение',
//       'prime_desc': 'Легкий доступ к достопримечательностям Бангкока',
//       'comfort': 'Максимальный комфорт',
//       'comfort_desc': 'Премиальные удобства для отдыха',
//       'whatsapp_not_available': 'WhatsApp недоступен',
//       'line_not_available': 'Line недоступен',
//       'copy_number_message': 'Скопируйте номер для связи через WhatsApp:',
//       'copy_line_id_message': 'Скопируйте Line ID для связи через Line:',
//       'choose_contact_method': 'Выберите способ связи',
//       'via_whatsapp': 'Через WhatsApp',
//       'via_line': 'Через Line',
//       'cancel': 'Отмена',
//       'copy_number': 'Копировать номер',
//       'copy_line_id': 'Копировать Line ID',
//       'phone_number_copied': 'Номер скопирован!',
//       'line_id_copied': 'Line ID скопирован!',
//       'whatsapp_message': 'Здравствуйте, хочу забронировать {roomName}.',
//       'whatsapp_message_default': 'Здравствуйте, хочу забронировать номер в P29.',
//       'address_copied': 'Адрес скопирован!',
//       'phone_copied': 'Номер скопирован!',
//       'email_copied': 'Email скопирован!',
//     },
//     Language.chinese: {
//       'hostel_name': 'P29 旅舍',
//       'tagline': '曼谷的现代舒适',
//       'subtitle': '您在曼谷市中心的宁静居所',
//       'location': '廊开区，曼谷',
//       'book_now': '预订住宿',
//       'explore': '探索',
//       'welcome': '欢迎来到 P29',
//       'welcome_subtitle': '现代设计与泰式待客之道的完美结合',
//       'welcome_desc':
//           '在曼谷宁静的廊开区发现P29旅舍。我们的现代家庭房配有空调、私人浴室以及美丽的花园或城市景观。每间客房都设有私人阳台、洗衣机和免费WiFi。在我们宁静的花园、宽敞的露台或充满活力的酒吧放松身心，同时享受我们的现场迷你市场和手工咖啡店。',
//       'rooms': '住宿',
//       'rooms_subtitle': '为您的舒适而设计',
//       'family_room': '家庭房',
//       'family_features': '空调 • 私人浴室 • 城市景观 • 阳台',
//       'garden_room': '花园景观房',
//       'garden_features': '花园景观 • 洗衣机 • 免费WiFi • 露台',
//       'deluxe_room': '豪华房',
//       'deluxe_features': '高级床上用品 • 智能电视 • 迷你冰箱 • 工作桌',
//       'facilities': '设施',
//       'facilities_subtitle': '您需要的一切',
//       'free_wifi': '高速WiFi',
//       'parking': '免费停车',
//       'garden': '花园和露台',
//       'bar': '酒吧和咖啡店',
//       'minimarket': '迷你市场',
//       'security': '24/7安保',
//       'housekeeping': '每日清洁',
//       'non_smoking': '禁烟',
//       'safe': '保险箱',
//       'express_checkin': '快速入住',
//       'location_title': '位置',
//       'location_subtitle': '曼谷的完美位置',
//       'nearby': '附近景点',
//       'wat_arun': '黎明寺 - 12英里',
//       'grand_palace': '大皇宫 - 13英里',
//       'floating_market': '水上市场 - 8英里',
//       'paradise_park': '天堂公园 - 3.7英里',
//       'reviews': '客人评价',
//       'contact': '联系我们',
//       'address': '地址',
//       'address_full': '55/7 Liap Khlong Phasi Charoen\nFang Nuea 10 Alley, 廊开区\n曼谷 10160，泰国',
//       'phone': '电话',
//       'email': '邮箱',
//       'check_in': '入住：下午2:00',
//       'check_out': '退房：上午7:00 - 中午12:00',
//       'gallery': '画廊',
//       'view_all': '查看所有照片',
//       'languages': '语言',
//       'lang_staff': '英语 • 泰语 • 中文',
//       'why_choose': '为什么选择 P29',
//       'why_subtitle': '体验不同',
//       'modern_design': '现代设计',
//       'modern_desc': '现代室内设计融合泰式风格',
//       'prime_location': '优越位置',
//       'prime_desc': '轻松前往曼谷景点',
//       'comfort': '极致舒适',
//       'comfort_desc': '高级设施让您轻松休息',
//       'whatsapp_not_available': 'WhatsApp 不可用',
//       'line_not_available': 'Line 不可用',
//       'copy_number_message': '复制此号码通过 WhatsApp 联系：',
//       'copy_line_id_message': '复制此 Line ID 通过 Line 联系：',
//       'choose_contact_method': '选择联系方式',
//       'via_whatsapp': '通过 WhatsApp',
//       'via_line': '通过 Line',
//       'cancel': '取消',
//       'copy_number': '复制号码',
//       'copy_line_id': '复制 Line ID',
//       'phone_number_copied': '号码已复制！',
//       'line_id_copied': 'Line ID 已复制！',
//       'whatsapp_message': '您好，我想预订 {roomName}。',
//       'whatsapp_message_default': '您好，我想在P29旅舍预订房间。',
//       'address_copied': '地址已复制！',
//       'phone_copied': '号码已复制！',
//       'email_copied': '邮箱已复制！',
//     },
//   };

//   static String get(Language lang, String key) {
//     return _translations[lang]?[key] ?? key;
//   }
// }

// // Main Landing Page with State Management
// class LandingPage extends StatefulWidget {
//   const LandingPage({Key? key}) : super(key: key);

//   @override
//   State<LandingPage> createState() => _LandingPageState();
// }

// class _LandingPageState extends State<LandingPage>
//     with TickerProviderStateMixin {
//   Language _currentLanguage = Language.english;
//   final ScrollController _scrollController = ScrollController();
//   late AnimationController _fadeController;
//   late AnimationController _slideController;
//   bool _showBackToTop = false;

//   // Section keys for navigation
//   final GlobalKey _homeKey = GlobalKey();
//   final GlobalKey _roomsKey = GlobalKey();
//   final GlobalKey _facilitiesKey = GlobalKey();
//   final GlobalKey _locationKey = GlobalKey();
//   final GlobalKey _contactKey = GlobalKey();

//   @override
//   void initState() {
//     super.initState();
//     _fadeController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     )..forward();

//     _slideController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     )..forward();

//     _scrollController.addListener(() {
//       if (_scrollController.offset > 300 && !_showBackToTop) {
//         setState(() => _showBackToTop = true);
//       } else if (_scrollController.offset <= 300 && _showBackToTop) {
//         setState(() => _showBackToTop = false);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     _fadeController.dispose();
//     _slideController.dispose();
//     super.dispose();
//   }

//   String t(String key) => Translations.get(_currentLanguage, key);

//   void _scrollToSection(GlobalKey key) {
//     final context = key.currentContext;
//     if (context != null) {
//       Scrollable.ensureVisible(
//         context,
//         duration: const Duration(milliseconds: 800),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   void commonLaunchUrl(String url) async {
//     final uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = MediaQuery.of(context).size.width < 768;
//     final isTablet = MediaQuery.of(context).size.width >= 768 &&
//         MediaQuery.of(context).size.width < 1024;

//     return Scaffold(
//       body: Stack(
//         children: [
//           // Main Content
//           CustomScrollView(
//             controller: _scrollController,
//             slivers: [
//               // Custom App Bar
//               SliverAppBar(
//                 expandedHeight: isMobile ? 80 : 100,
//                 floating: true,
//                 pinned: true,
//                 elevation: 0,
//                 backgroundColor: const Color(0xFF0A2463).withOpacity(0.95),
//                 flexibleSpace: FlexibleSpaceBar(
//                   background: Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           const Color(0xFF0A2463),
//                           const Color(0xFF1E3A8A),
//                         ],
//                       ),
//                     ),
//                   ),
//                   title: Text(
//                     t('hostel_name'),
//                     style: GoogleFonts.poppins(
//                       fontSize: isMobile ? 18 : 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   centerTitle: false,
//                 ),
//                 actions: [
//                   if (!isMobile) ...[
//                     _buildNavButton('Home', _homeKey),
//                     _buildNavButton('Rooms', _roomsKey),
//                     _buildNavButton('Facilities', _facilitiesKey),
//                     _buildNavButton('Location', _locationKey),
//                     _buildNavButton('Contact', _contactKey),
//                   ],
//                   _buildLanguageSelector(isMobile),
//                   const SizedBox(width: 16),
//                 ],
//               ),

//               // Hero Section
//               SliverToBoxAdapter(
//                 child: FadeTransition(
//                   opacity: _fadeController,
//                   child: _buildHeroSection(isMobile),
//                 ),
//               ),

//               // Welcome Section
//               SliverToBoxAdapter(
//                 child: SlideTransition(
//                   position: Tween<Offset>(
//                     begin: const Offset(0, 0.3),
//                     end: Offset.zero,
//                   ).animate(CurvedAnimation(
//                     parent: _slideController,
//                     curve: Curves.easeOut,
//                   )),
//                   child: _buildWelcomeSection(isMobile),
//                 ),
//               ),

//               // Why Choose P29 Section
//               SliverToBoxAdapter(
//                 child: _buildWhyChooseSection(isMobile),
//               ),

//               // Rooms Section
//               SliverToBoxAdapter(
//                 child: Container(
//                   key: _roomsKey,
//                   child: _buildRoomsSection(isMobile),
//                 ),
//               ),

//               // Facilities Section
//               SliverToBoxAdapter(
//                 child: Container(
//                   key: _facilitiesKey,
//                   child: _buildFacilitiesSection(isMobile),
//                 ),
//               ),

//               // Location Section
//               SliverToBoxAdapter(
//                 child: Container(
//                   key: _locationKey,
//                   child: _buildLocationSection(isMobile),
//                 ),
//               ),

//               // Contact Section
//               SliverToBoxAdapter(
//                 child: Container(
//                   key: _contactKey,
//                   child: _buildContactSection(isMobile),
//                 ),
//               ),

//               // Footer
//               SliverToBoxAdapter(
//                 child: _buildFooter(isMobile),
//               ),
//             ],
//           ),

//           // Back to Top Button
//           if (_showBackToTop)
//             Positioned(
//               right: 16,
//               bottom: 16,
//               child: FloatingActionButton(
//                 onPressed: () {
//                   _scrollController.animateTo(
//                     0,
//                     duration: const Duration(milliseconds: 800),
//                     curve: Curves.easeInOut,
//                   );
//                 },
//                 backgroundColor: const Color(0xFF0A2463),
//                 child: const Icon(Icons.arrow_upward, color: Colors.white),
//               ),
//             ),

//           // Mobile Navigation Menu
//           if (isMobile)
//             Positioned(
//               left: 0,
//               right: 0,
//               bottom: 0,
//               child: _buildMobileNavBar(),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNavButton(String label, GlobalKey key) {
//     return TextButton(
//       onPressed: () => _scrollToSection(key),
//       child: Text(
//         label,
//         style: GoogleFonts.poppins(
//           color: Colors.white,
//           fontWeight: FontWeight.w500,
//           fontSize: 14,
//         ),
//       ),
//     );
//   }

//   Widget _buildLanguageSelector(bool isMobile) {
//     return PopupMenuButton<Language>(
//       icon: const Icon(Icons.language, color: Colors.white),
//       onSelected: (Language lang) {
//         setState(() => _currentLanguage = lang);
//       },
//       itemBuilder: (context) => [
//         PopupMenuItem(
//           value: Language.english,
//           child: Row(
//             children: [
//               Text('🇬🇧', style: TextStyle(fontSize: 20)),
//               SizedBox(width: 12),
//               Text('English', style: GoogleFonts.poppins()),
//             ],
//           ),
//         ),
//         PopupMenuItem(
//           value: Language.thai,
//           child: Row(
//             children: [
//               Text('🇹🇭', style: TextStyle(fontSize: 20)),
//               SizedBox(width: 12),
//               Text('ไทย', style: GoogleFonts.poppins()),
//             ],
//           ),
//         ),
//         PopupMenuItem(
//           value: Language.russian,
//           child: Row(
//             children: [
//               Text('🇷🇺', style: TextStyle(fontSize: 20)),
//               SizedBox(width: 12),
//               Text('Русский', style: GoogleFonts.poppins()),
//             ],
//           ),
//         ),
//         PopupMenuItem(
//           value: Language.chinese,
//           child: Row(
//             children: [
//               Text('🇨🇳', style: TextStyle(fontSize: 20)),
//               SizedBox(width: 12),
//               Text('中文', style: GoogleFonts.poppins()),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildHeroSection(bool isMobile) {
//     return Container(
//       key: _homeKey,
//       height: isMobile ? 600 : 700,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             const Color(0xFF0A2463),
//             const Color(0xFF1E3A8A),
//             const Color(0xFF0891B2),
//           ],
//         ),
//       ),
//       child: Stack(
//         children: [
//           // Animated Background Pattern
//           Positioned.fill(
//             child: CustomPaint(
//               painter: GeometricPatternPainter(),
//             ),
//           ),

//           // Content
//           Center(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Logo placeholder - replace with actual logo
//                   Container(
//                     width: isMobile ? 100 : 140,
//                     height: isMobile ? 100 : 140,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.2),
//                           blurRadius: 20,
//                           offset: const Offset(0, 10),
//                         ),
//                       ],
//                     ),
//                     child: Center(
//                       child: Text(
//                         'P29',
//                         style: GoogleFonts.poppins(
//                           fontSize: isMobile ? 36 : 48,
//                           fontWeight: FontWeight.bold,
//                           color: const Color(0xFF0A2463),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 32),
//                   Text(
//                     t('tagline'),
//                     style: GoogleFonts.poppins(
//                       fontSize: isMobile ? 32 : 56,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       height: 1.2,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     t('subtitle'),
//                     style: GoogleFonts.poppins(
//                       fontSize: isMobile ? 16 : 20,
//                       color: Colors.white.withOpacity(0.9),
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.location_on,
//                           color: Colors.white.withOpacity(0.8), size: 20),
//                       const SizedBox(width: 8),
//                       Text(
//                         t('location'),
//                         style: GoogleFonts.poppins(
//                           fontSize: isMobile ? 14 : 16,
//                           color: Colors.white.withOpacity(0.8),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 48),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _buildGlowingButton(
//                         t('book_now'),
//                         Icons.calendar_month,
//                         () {
//                           _showBookingDialog(context);
//                         },
//                         isPrimary: true,
//                       ),
//                       const SizedBox(width: 16),
//                       _buildGlowingButton(
//                         t('explore'),
//                         Icons.explore,
//                         () => _scrollToSection(_roomsKey),
//                         isPrimary: false,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildGlowingButton(
//       String text, IconData icon, VoidCallback onPressed,
//       {required bool isPrimary}) {
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: onPressed,
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//           decoration: BoxDecoration(
//             gradient: isPrimary
//                 ? LinearGradient(
//                     colors: [
//                       const Color(0xFFD4AF37),
//                       const Color(0xFFF4D03F),
//                     ],
//                   )
//                 : null,
//             color: isPrimary ? null : Colors.white.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(30),
//             border: isPrimary
//                 ? null
//                 : Border.all(color: Colors.white.withOpacity(0.5), width: 2),
//             boxShadow: isPrimary
//                 ? [
//                     BoxShadow(
//                       color: const Color(0xFFD4AF37).withOpacity(0.5),
//                       blurRadius: 20,
//                       offset: const Offset(0, 10),
//                     ),
//                   ]
//                 : null,
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(
//                 icon,
//                 color: isPrimary ? const Color(0xFF0A2463) : Colors.white,
//                 size: 20,
//               ),
//               const SizedBox(width: 12),
//               Text(
//                 text,
//                 style: GoogleFonts.poppins(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: isPrimary ? const Color(0xFF0A2463) : Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildWelcomeSection(bool isMobile) {
//     return Container(
//       padding: EdgeInsets.all(isMobile ? 32 : 80),
//       color: Colors.white,
//       child: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 1200),
//           child: Column(
//             children: [
//               Text(
//                 t('welcome'),
//                 style: GoogleFonts.poppins(
//                   fontSize: isMobile ? 36 : 48,
//                   fontWeight: FontWeight.bold,
//                   color: const Color(0xFF0A2463),
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 t('welcome_subtitle'),
//                 style: GoogleFonts.poppins(
//                   fontSize: isMobile ? 18 : 24,
//                   color: const Color(0xFF0891B2),
//                   fontWeight: FontWeight.w500,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 32),
//               Container(
//                 padding: const EdgeInsets.all(32),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFF8F9FA),
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(
//                     color: const Color(0xFF0891B2).withOpacity(0.2),
//                     width: 2,
//                   ),
//                 ),
//                 child: Text(
//                   t('welcome_desc'),
//                   style: GoogleFonts.poppins(
//                     fontSize: isMobile ? 16 : 18,
//                     height: 1.8,
//                     color: const Color(0xFF1F2937),
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildWhyChooseSection(bool isMobile) {
//     return Container(
//       padding: EdgeInsets.all(isMobile ? 32 : 80),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             const Color(0xFFF8F9FA),
//             const Color(0xFFE5E7EB),
//           ],
//         ),
//       ),
//       child: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 1200),
//           child: Column(
//             children: [
//               Text(
//                 t('why_choose'),
//                 style: GoogleFonts.poppins(
//                   fontSize: isMobile ? 36 : 48,
//                   fontWeight: FontWeight.bold,
//                   color: const Color(0xFF0A2463),
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 t('why_subtitle'),
//                 style: GoogleFonts.poppins(
//                   fontSize: isMobile ? 16 : 20,
//                   color: const Color(0xFF6B7280),
//                 ),
//               ),
//               const SizedBox(height: 48),
//               Wrap(
//                 spacing: 24,
//                 runSpacing: 24,
//                 alignment: WrapAlignment.center,
//                 children: [
//                   _buildFeatureCard(
//                     Icons.palette,
//                     t('modern_design'),
//                     t('modern_desc'),
//                     isMobile,
//                   ),
//                   _buildFeatureCard(
//                     Icons.location_city,
//                     t('prime_location'),
//                     t('prime_desc'),
//                     isMobile,
//                   ),
//                   _buildFeatureCard(
//                     Icons.hotel,
//                     t('comfort'),
//                     t('comfort_desc'),
//                     isMobile,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildFeatureCard(
//       IconData icon, String title, String desc, bool isMobile) {
//     return Container(
//       width: isMobile ? double.infinity : 350,
//       padding: const EdgeInsets.all(32),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF0A2463).withOpacity(0.1),
//             blurRadius: 20,
//             offset: const Offset(0, 10),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   const Color(0xFF0891B2),
//                   const Color(0xFF06B6D4),
//                 ],
//               ),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(icon, size: 40, color: Colors.white),
//           ),
//           const SizedBox(height: 24),
//           Text(
//             title,
//             style: GoogleFonts.poppins(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: const Color(0xFF0A2463),
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 12),
//           Text(
//             desc,
//             style: GoogleFonts.poppins(
//               fontSize: 14,
//               color: const Color(0xFF6B7280),
//               height: 1.6,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildRoomsSection(bool isMobile) {
//     return Container(
//       padding: EdgeInsets.all(isMobile ? 32 : 80),
//       color: Colors.white,
//       child: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 1200),
//           child: Column(
//             children: [
//               Text(
//                 t('rooms'),
//                 style: GoogleFonts.poppins(
//                   fontSize: isMobile ? 36 : 48,
//                   fontWeight: FontWeight.bold,
//                   color: const Color(0xFF0A2463),
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 t('rooms_subtitle'),
//                 style: GoogleFonts.poppins(
//                   fontSize: isMobile ? 16 : 20,
//                   color: const Color(0xFF6B7280),
//                 ),
//               ),
//               const SizedBox(height: 48),
//               Wrap(
//                 spacing: 24,
//                 runSpacing: 24,
//                 alignment: WrapAlignment.center,
//                 children: [
//                   _buildRoomCard(
//                     t('family_room'),
//                     t('family_features'),
//                     Icons.family_restroom,
//                     const Color(0xFF0891B2),
//                     isMobile,
//                   ),
//                   _buildRoomCard(
//                     t('garden_room'),
//                     t('garden_features'),
//                     Icons.nature_people,
//                     const Color(0xFF059669),
//                     isMobile,
//                   ),
//                   _buildRoomCard(
//                     t('deluxe_room'),
//                     t('deluxe_features'),
//                     Icons.king_bed,
//                     const Color(0xFFD4AF37),
//                     isMobile,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildRoomCard(String title, String features, IconData icon,
//       Color color, bool isMobile) {
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: () => _showBookingDialog(context, roomName: title),
//         child: Container(
//           width: isMobile ? double.infinity : 360,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(color: color.withOpacity(0.3), width: 2),
//             boxShadow: [
//               BoxShadow(
//                 color: color.withOpacity(0.2),
//                 blurRadius: 20,
//                 offset: const Offset(0, 10),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 200,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [color.withOpacity(0.8), color],
//                   ),
//                   borderRadius:
//                       const BorderRadius.vertical(top: Radius.circular(18)),
//                 ),
//                 child: Center(
//                   child: Icon(icon, size: 80, color: Colors.white),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(24),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: GoogleFonts.poppins(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: const Color(0xFF0A2463),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Text(
//                       features,
//                       style: GoogleFonts.poppins(
//                         fontSize: 14,
//                         color: const Color(0xFF6B7280),
//                         height: 1.8,
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(colors: [color, color]),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             t('book_now'),
//                             style: GoogleFonts.poppins(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           const Icon(Icons.arrow_forward,
//                               color: Colors.white, size: 20),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildFacilitiesSection(bool isMobile) {
//     return Container(
//       padding: EdgeInsets.all(isMobile ? 32 : 80),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             const Color(0xFF0A2463).withOpacity(0.05),
//             const Color(0xFF0891B2).withOpacity(0.05),
//           ],
//         ),
//       ),
//       child: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 1200),
//           child: Column(
//             children: [
//               Text(
//                 t('facilities'),
//                 style: GoogleFonts.poppins(
//                   fontSize: isMobile ? 36 : 48,
//                   fontWeight: FontWeight.bold,
//                   color: const Color(0xFF0A2463),
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 t('facilities_subtitle'),
//                 style: GoogleFonts.poppins(
//                   fontSize: isMobile ? 16 : 20,
//                   color: const Color(0xFF6B7280),
//                 ),
//               ),
//               const SizedBox(height: 48),
//               Wrap(
//                 spacing: 24,
//                 runSpacing: 24,
//                 alignment: WrapAlignment.center,
//                 children: [
//                   _buildFacilityItem(Icons.wifi, t('free_wifi'), isMobile),
//                   _buildFacilityItem(
//                       Icons.local_parking, t('parking'), isMobile),
//                   _buildFacilityItem(Icons.park, t('garden'), isMobile),
//                   _buildFacilityItem(Icons.local_bar, t('bar'), isMobile),
//                   _buildFacilityItem(
//                       Icons.store, t('minimarket'), isMobile),
//                   _buildFacilityItem(Icons.security, t('security'), isMobile),
//                   _buildFacilityItem(
//                       Icons.cleaning_services, t('housekeeping'), isMobile),
//                   _buildFacilityItem(
//                       Icons.smoke_free, t('non_smoking'), isMobile),
//                   _buildFacilityItem(Icons.lock, t('safe'), isMobile),
//                   _buildFacilityItem(
//                       Icons.speed, t('express_checkin'), isMobile),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildFacilityItem(IconData icon, String label, bool isMobile) {
//     return Container(
//       width: isMobile ? (MediaQuery.of(context).size.width - 80) / 2 : 220,
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF0A2463).withOpacity(0.08),
//             blurRadius: 15,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   const Color(0xFF0891B2).withOpacity(0.2),
//                   const Color(0xFF06B6D4).withOpacity(0.2),
//                 ],
//               ),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(icon, size: 32, color: const Color(0xFF0891B2)),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             label,
//             style: GoogleFonts.poppins(
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               color: const Color(0xFF1F2937),
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildLocationSection(bool isMobile) {
//     return Container(
//       padding: EdgeInsets.all(isMobile ? 32 : 80),
//       color: Colors.white,
//       child: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 1200),
//           child: Column(
//             children: [
//               Text(
//                 t('location_title'),
//                 style: GoogleFonts.poppins(
//                   fontSize: isMobile ? 36 : 48,
//                   fontWeight: FontWeight.bold,
//                   color: const Color(0xFF0A2463),
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 t('location_subtitle'),
//                 style: GoogleFonts.poppins(
//                   fontSize: isMobile ? 16 : 20,
//                   color: const Color(0xFF6B7280),
//                 ),
//               ),
//               const SizedBox(height: 48),
//               Container(
//                 padding: const EdgeInsets.all(32),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFF8F9FA),
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(
//                     color: const Color(0xFF0891B2).withOpacity(0.2),
//                     width: 2,
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Text(
//                       t('nearby'),
//                       style: GoogleFonts.poppins(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: const Color(0xFF0A2463),
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     Wrap(
//                       spacing: 16,
//                       runSpacing: 16,
//                       alignment: WrapAlignment.center,
//                       children: [
//                         _buildAttractionChip(t('wat_arun')),
//                         _buildAttractionChip(t('grand_palace')),
//                         _buildAttractionChip(t('floating_market')),
//                         _buildAttractionChip(t('paradise_park')),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildAttractionChip(String label) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             const Color(0xFF0891B2).withOpacity(0.1),
//             const Color(0xFF06B6D4).withOpacity(0.1),
//           ],
//         ),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: const Color(0xFF0891B2).withOpacity(0.3),
//           width: 1.5,
//         ),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Icon(Icons.place, color: Color(0xFF0891B2), size: 20),
//           const SizedBox(width: 8),
//           Text(
//             label,
//             style: GoogleFonts.poppins(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//               color: const Color(0xFF0A2463),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildContactSection(bool isMobile) {
//     return Container(
//       padding: EdgeInsets.all(isMobile ? 32 : 80),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             const Color(0xFF0A2463),
//             const Color(0xFF1E3A8A),
//           ],
//         ),
//       ),
//       child: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 1200),
//           child: Column(
//             children: [
//               Text(
//                 t('contact'),
//                 style: GoogleFonts.poppins(
//                   fontSize: isMobile ? 36 : 48,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 48),
//               Wrap(
//                 spacing: 24,
//                 runSpacing: 24,
//                 alignment: WrapAlignment.center,
//                 children: [
//                   _buildContactCard(
//                     Icons.location_on,
//                     t('address'),
//                     t('address_full'),
//                     () {
//                       Clipboard.setData(
//                           ClipboardData(text: t('address_full')));
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text(t('address_copied')),
//                           behavior: SnackBarBehavior.floating,
//                           backgroundColor: const Color(0xFF059669),
//                         ),
//                       );
//                     },
//                   ),
//                   _buildContactCard(
//                     Icons.phone,
//                     t('phone'),
//                     '+66 XX XXX XXXX', // Replace with actual phone
//                     () {
//                       Clipboard.setData(
//                           ClipboardData(text: '+66 XX XXX XXXX'));
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text(t('phone_copied')),
//                           behavior: SnackBarBehavior.floating,
//                           backgroundColor: const Color(0xFF059669),
//                         ),
//                       );
//                     },
//                   ),
//                   _buildContactCard(
//                     Icons.email,
//                     t('email'),
//                     'info@p29hostel.com', // Replace with actual email
//                     () {
//                       commonLaunchUrl('mailto:info@p29hostel.com');
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 48),
//               Container(
//                 padding: const EdgeInsets.all(32),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(
//                     color: Colors.white.withOpacity(0.2),
//                     width: 2,
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Text(
//                       t('check_in'),
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       t('check_out'),
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildContactCard(
//       IconData icon, String title, String info, VoidCallback onTap) {
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           width: 320,
//           padding: const EdgeInsets.all(32),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 20,
//                 offset: const Offset(0, 10),
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       const Color(0xFF0891B2),
//                       const Color(0xFF06B6D4),
//                     ],
//                   ),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(icon, size: 32, color: Colors.white),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 title,
//                 style: GoogleFonts.poppins(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: const Color(0xFF0A2463),
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 info,
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.poppins(
//                   fontSize: 14,
//                   height: 1.6,
//                   color: const Color(0xFF6B7280),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildFooter(bool isMobile) {
//     return Container(
//       padding: EdgeInsets.all(isMobile ? 32 : 48),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             const Color(0xFF1F2937),
//             const Color(0xFF111827),
//           ],
//         ),
//       ),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               _buildSocialButton(Icons.facebook, () {
//                 // Add Facebook link
//               }),
//               const SizedBox(width: 16),
//               _buildSocialButton(Icons.photo_camera, () {
//                 // Add Instagram link
//               }),
//               const SizedBox(width: 16),
//               _buildSocialButton(Icons.map, () {
//                 // Add Google Maps link
//               }),
//             ],
//           ),
//           const SizedBox(height: 32),
//           Divider(color: Colors.white.withOpacity(0.2)),
//           const SizedBox(height: 16),
//           Text(
//             '© 2025 P29 Hostel Bangkok. All rights reserved.',
//             textAlign: TextAlign.center,
//             style: GoogleFonts.poppins(
//               color: Colors.white70,
//               fontSize: isMobile ? 12 : 14,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSocialButton(IconData icon, VoidCallback onTap) {
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 const Color(0xFF0891B2),
//                 const Color(0xFF06B6D4),
//               ],
//             ),
//             shape: BoxShape.circle,
//             boxShadow: [
//               BoxShadow(
//                 color: const Color(0xFF0891B2).withOpacity(0.5),
//                 blurRadius: 15,
//                 offset: const Offset(0, 5),
//               ),
//             ],
//           ),
//           child: Icon(icon, color: Colors.white, size: 24),
//         ),
//       ),
//     );
//   }

//   Widget _buildMobileNavBar() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: const Offset(0, -5),
//           ),
//         ],
//       ),
//       child: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildMobileNavItem(Icons.home, 'Home', _homeKey),
//               _buildMobileNavItem(Icons.bed, 'Rooms', _roomsKey),
//               _buildMobileNavItem(Icons.grid_view, 'Facilities', _facilitiesKey),
//               _buildMobileNavItem(Icons.location_on, 'Location', _locationKey),
//               _buildMobileNavItem(Icons.contact_mail, 'Contact', _contactKey),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMobileNavItem(IconData icon, String label, GlobalKey key) {
//     return InkWell(
//       onTap: () => _scrollToSection(key),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, color: const Color(0xFF0A2463), size: 24),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             style: GoogleFonts.poppins(
//               fontSize: 10,
//               color: const Color(0xFF0A2463),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showBookingDialog(BuildContext context, {String? roomName}) {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         child: Container(
//           padding: const EdgeInsets.all(32),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 const Color(0xFF0A2463),
//                 const Color(0xFF1E3A8A),
//               ],
//             ),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 t('choose_contact_method'),
//                 style: GoogleFonts.poppins(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 32),
//               _buildBookingButton(
//                 t('via_whatsapp'),
//                 Icons.chat,
//                 () {
//                   Navigator.pop(context);
//                   final message = roomName != null
//                       ? t('whatsapp_message').replaceAll('{roomName}', roomName)
//                       : t('whatsapp_message_default');
//                   commonLaunchUrl(
//                       'https://wa.me/66XXXXXXXXX?text=${Uri.encodeComponent(message)}');
//                 },
//               ),
//               const SizedBox(height: 16),
//               _buildBookingButton(
//                 t('via_line'),
//                 Icons.chat_bubble,
//                 () {
//                   Navigator.pop(context);
//                   commonLaunchUrl('https://line.me/ti/p/~LINEUSERNAME');
//                 },
//               ),
//               const SizedBox(height: 24),
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: Text(
//                   t('cancel'),
//                   style: GoogleFonts.poppins(
//                     color: Colors.white70,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildBookingButton(String text, IconData icon, VoidCallback onTap) {
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           width: double.infinity,
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icon, color: const Color(0xFF0A2463)),
//               const SizedBox(width: 12),
//               Text(
//                 text,
//                 style: GoogleFonts.poppins(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: const Color(0xFF0A2463),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Custom Painter for Geometric Background Pattern
// class GeometricPatternPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white.withOpacity(0.05)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2;

//     // Draw geometric pattern
//     for (double i = 0; i < size.width; i += 100) {
//       for (double j = 0; j < size.height; j += 100) {
//         canvas.drawCircle(Offset(i, j), 30, paint);
//         canvas.drawRect(
//           Rect.fromCenter(center: Offset(i + 50, j + 50), width: 40, height: 40),
//           paint,
//         );
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
