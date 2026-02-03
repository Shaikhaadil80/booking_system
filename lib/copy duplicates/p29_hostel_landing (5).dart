import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';
import 'dart:async';

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
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
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

// Enhanced utility functions
Future<void> p29LaunchUrl(String url) async {
  try {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error launching URL: $e');
    }
  }
}

// Animation Widgets
class FadeInSection extends StatefulWidget {
  final Widget child;
  final int delay;
  final double offset;

  const FadeInSection({
    Key? key,
    required this.child,
    this.delay = 0,
    this.offset = 50,
  }) : super(key: key);

  @override
  State<FadeInSection> createState() => _FadeInSectionState();
}

class _FadeInSectionState extends State<FadeInSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _offsetAnimation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    
    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOutCubic),
      ),
    );
    
    _offsetAnimation = Tween<double>(begin: widget.offset, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOutCubic),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _checkVisibility() {
    if (!_hasAnimated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          final position = renderBox.localToGlobal(Offset.zero);
          final screenHeight = MediaQuery.of(context).size.height;
          
          if (position.dy < screenHeight * 0.8) {
            Future.delayed(Duration(milliseconds: widget.delay), () {
              _controller.forward();
              _hasAnimated = true;
            });
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkVisibility();
    
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacity.value,
          child: Transform.translate(
            offset: Offset(0, _offsetAnimation.value),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

class SlideUpWidget extends StatefulWidget {
  final Widget child;
  final int delay;
  final double offset;

  const SlideUpWidget({
    Key? key,
    required this.child,
    this.delay = 0,
    this.offset = 30,
  }) : super(key: key);

  @override
  State<SlideUpWidget> createState() => _SlideUpWidgetState();
}

class _SlideUpWidgetState extends State<SlideUpWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _offsetAnimation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
      ),
    );
    
    _offsetAnimation = Tween<double>(begin: widget.offset, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (!_hasAnimated) {
      Future.delayed(Duration(milliseconds: widget.delay), () {
        if (mounted) {
          _controller.forward();
          _hasAnimated = true;
        }
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacity.value,
          child: Transform.translate(
            offset: Offset(0, _offsetAnimation.value),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

class ScaleInWidget extends StatefulWidget {
  final Widget child;
  final int delay;
  final double scale;

  const ScaleInWidget({
    Key? key,
    required this.child,
    this.delay = 0,
    this.scale = 0.8,
  }) : super(key: key);

  @override
  State<ScaleInWidget> createState() => _ScaleInWidgetState();
}

class _ScaleInWidgetState extends State<ScaleInWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;
  late Animation<double> _opacity;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    
    _scale = Tween<double>(begin: widget.scale, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );
    
    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (!_hasAnimated) {
      Future.delayed(Duration(milliseconds: widget.delay), () {
        if (mounted) {
          _controller.forward();
          _hasAnimated = true;
        }
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacity.value,
          child: Transform.scale(
            scale: _scale.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

class RippleButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final Color rippleColor;
  final Duration duration;

  const RippleButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.rippleColor = const Color(0xFF1A237E),
    this.duration = const Duration(milliseconds: 400),
  }) : super(key: key);

  @override
  State<RippleButton> createState() => _RippleButtonState();
}

class _RippleButtonState extends State<RippleButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;
  late Animation<double> _elevation;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scale = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _elevation = Tween<double>(begin: 8.0, end: 4.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onTap() async {
    await _controller.forward();
    await _controller.reverse();
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scale.value,
          child: Material(
            elevation: _elevation.value,
            borderRadius: BorderRadius.circular(12),
            child: child,
          ),
        );
      },
      child: InkWell(
        onTap: _onTap,
        borderRadius: BorderRadius.circular(12),
        splashColor: widget.rippleColor.withOpacity(0.2),
        highlightColor: widget.rippleColor.withOpacity(0.1),
        child: widget.child,
      ),
    );
  }
}

class ShimmerEffect extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const ShimmerEffect({
    Key? key,
    required this.child,
    this.duration = const Duration(seconds: 2),
  }) : super(key: key);

  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);
    
    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              colors: [
                Colors.transparent,
                Colors.white.withOpacity(0.3),
                Colors.transparent,
              ],
              stops: [_animation.value, _animation.value + 0.5, _animation.value + 1.0],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(rect);
          },
          blendMode: BlendMode.srcATop,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class FloatingParticle extends StatefulWidget {
  final double size;
  final Color color;
  final double startX;
  final double startY;
  final Duration duration;

  const FloatingParticle({
    Key? key,
    this.size = 2.0,
    this.color = const Color(0xFF1A237E),
    this.startX = 0,
    this.startY = 0,
    this.duration = const Duration(seconds: 3),
  }) : super(key: key);

  @override
  State<FloatingParticle> createState() => _FloatingParticleState();
}

class _FloatingParticleState extends State<FloatingParticle> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _xAnimation;
  late Animation<double> _yAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);
    
    final random = Random();
    _xAnimation = Tween<double>(
      begin: widget.startX,
      end: widget.startX + random.nextDouble() * 100 - 50,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    
    _yAnimation = Tween<double>(
      begin: widget.startY,
      end: widget.startY + random.nextDouble() * 100 - 50,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
    ));
    
    _opacityAnimation = Tween<double>(
      begin: 0.1,
      end: 0.4,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          left: _xAnimation.value,
          top: _yAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                color: widget.color,
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }
}

class ScrollIndicator extends StatefulWidget {
  final ScrollController scrollController;

  const ScrollIndicator({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<ScrollIndicator> createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<ScrollIndicator> {
  double _scrollPercentage = 0.0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_updateScrollPercentage);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_updateScrollPercentage);
    super.dispose();
  }

  void _updateScrollPercentage() {
    final maxScroll = widget.scrollController.position.maxScrollExtent;
    if (maxScroll > 0) {
      setState(() {
        _scrollPercentage = widget.scrollController.position.pixels / maxScroll;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: SizedBox(
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: _scrollPercentage,
                  backgroundColor: Colors.white.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    const Color(0xFF1A237E).withOpacity(0.8),
                  ),
                  minHeight: 3,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xFF1A237E).withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '${(_scrollPercentage * 100).toInt()}%',
              style: GoogleFonts.poppins(
                fontSize: 10,
                color: const Color(0xFF1A237E),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionIndicator extends StatefulWidget {
  final Map<String, GlobalKey> sections;
  final ScrollController scrollController;

  const SectionIndicator({
    Key? key,
    required this.sections,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<SectionIndicator> createState() => _SectionIndicatorState();
}

class _SectionIndicatorState extends State<SectionIndicator> {
  final Map<String, double> _sectionPositions = {};
  String? _activeSection;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_updateActiveSection);
    WidgetsBinding.instance.addPostFrameCallback((_) => _calculateSectionPositions());
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_updateActiveSection);
    super.dispose();
  }

  void _calculateSectionPositions() {
    final positions = <String, double>{};
    
    widget.sections.forEach((name, key) {
      final context = key.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox?;
        if (box != null) {
          positions[name] = box.localToGlobal(Offset.zero).dy;
        }
      }
    });
    
    setState(() {
      _sectionPositions.clear();
      _sectionPositions.addAll(positions);
    });
  }

  void _updateActiveSection() {
    final scrollPosition = widget.scrollController.position.pixels;
    var closestSection = '';
    var smallestDistance = double.infinity;

    _sectionPositions.forEach((section, position) {
      final distance = (scrollPosition - position).abs();
      if (distance < smallestDistance) {
        smallestDistance = distance;
        closestSection = section;
      }
    });

    if (closestSection != _activeSection) {
      setState(() {
        _activeSection = closestSection;
      });
    }
  }

  void _scrollToSection(String section) {
    final key = widget.sections[section];
    if (key != null) {
      final context = key.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.fastEaseInToSlowEaseOut,
          alignment: 0.1,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_sectionPositions.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: widget.sections.keys.map((section) {
          final isActive = _activeSection == section;
          return GestureDetector(
            onTap: () => _scrollToSection(section),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(vertical: 4),
              width: isActive ? 12 : 8,
              height: isActive ? 12 : 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? const Color(0xFF1A237E) : Colors.grey.withOpacity(0.5),
                boxShadow: isActive ? [
                  BoxShadow(
                    color: const Color(0xFF1A237E).withOpacity(0.5),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ] : null,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Main Page with Enhanced Animations
class P29LandingPage extends StatefulWidget {
  const P29LandingPage({Key? key}) : super(key: key);

  @override
  State<P29LandingPage> createState() => _P29LandingPageState();
}

class _P29LandingPageState extends State<P29LandingPage> 
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();
  Language _currentLanguage = Language.english;
  
  // Animation controllers
  late AnimationController _parallaxController;
  late Animation<double> _parallaxAnimation;
  late AnimationController _floatController;
  
  // Section keys
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _roomsKey = GlobalKey();
  final GlobalKey _amenitiesKey = GlobalKey();
  final GlobalKey _galleryKey = GlobalKey();
  final GlobalKey _locationKey = GlobalKey();
  final GlobalKey _testimonialsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  
  // Scroll tracking
  double _scrollPosition = 0.0;
  double _scrollPercentage = 0.0;
  bool _isScrolling = false;
  
  @override
  bool get wantKeepAlive => true;
  
  Map<String, GlobalKey> get sections => {
    'hero': _heroKey,
    'rooms': _roomsKey,
    'amenities': _amenitiesKey,
    'gallery': _galleryKey,
    'location': _locationKey,
    'testimonials': _testimonialsKey,
    'contact': _contactKey,
  };
  
  @override
  void initState() {
    super.initState();
    
    // Initialize animations
    _parallaxController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    
    _parallaxAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _parallaxController, curve: Curves.easeInOut),
    );
    
    _floatController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    
    // Setup scroll listener
    _scrollController.addListener(() {
      setState(() {
        _scrollPosition = _scrollController.position.pixels;
        final maxScroll = _scrollController.position.maxScrollExtent;
        if (maxScroll > 0) {
          _scrollPercentage = _scrollPosition / maxScroll;
        }
      });
    });
  }
  
  @override
  void dispose() {
    _scrollController.dispose();
    _parallaxController.dispose();
    _floatController.dispose();
    super.dispose();
  }
  
  Future<void> _scrollToSection(GlobalKey key) async {
    setState(() => _isScrolling = true);
    
    final context = key.currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 1200),
        curve: Curves.fastEaseInToSlowEaseOut,
        alignment: 0.1,
      );
    }
    
    // Add haptic feedback on mobile
    if (defaultTargetPlatform == TargetPlatform.iOS || 
        defaultTargetPlatform == TargetPlatform.android) {
      HapticFeedback.lightImpact();
    }
    
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() => _isScrolling = false);
      }
    });
  }
  
  void _changeLanguage(Language lang) {
    setState(() => _currentLanguage = lang);
    
    // Show animated snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.translate, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(
              'Language changed to ${lang.name.toUpperCase()}',
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF1A237E),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
  
  String t(String key) => P29Translations.get(_currentLanguage, key);
  
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
  
  Widget _buildFloatingActionButton(bool isMobile) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      transform: Matrix4.translationValues(
        0,
        _scrollPercentage > 0.1 ? 0 : 20,
        0,
      )..scale(_scrollPercentage > 0.1 ? 1.0 : 0.9),
      child: RippleButton(
        onTap: () => _showBookingDialog(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF1A237E), Color(0xFF3949AB)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF1A237E).withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedRotation(
                duration: const Duration(seconds: 10),
                turns: _scrollPercentage,
                child: const Icon(Icons.calendar_today, size: 20, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Text(
                t('book_now'),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildParallaxBackground() {
    return IgnorePointer(
      child: Stack(
        children: [
          // Animated gradient background
          AnimatedContainer(
            duration: const Duration(seconds: 2),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFFF8F9FA),
                  const Color(0xFFE8EAF6).withOpacity(0.5 + _scrollPercentage * 0.3),
                ],
              ),
            ),
          ),
          
          // Floating particles
          ...List.generate(20, (index) {
            return FloatingParticle(
              size: Random().nextDouble() * 3 + 1,
              color: const Color(0xFF1A237E).withOpacity(Random().nextDouble() * 0.2 + 0.05),
              startX: Random().nextDouble() * MediaQuery.of(context).size.width,
              startY: Random().nextDouble() * MediaQuery.of(context).size.height,
              duration: Duration(seconds: Random().nextInt(5) + 3),
            );
          }),
          
          // Large floating elements
          AnimatedBuilder(
            animation: _parallaxController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, sin(_parallaxAnimation.value * 2 * pi) * 20),
                child: Positioned(
                  top: 100,
                  right: 100,
                  child: Opacity(
                    opacity: 0.03,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF1A237E).withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          
          AnimatedBuilder(
            animation: _floatController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, sin(_floatController.value * 2 * pi) * 15),
                child: Positioned(
                  bottom: 200,
                  left: 50,
                  child: Opacity(
                    opacity: 0.02,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF1A237E).withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  
  AppBar _buildDesktopAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _scrollPosition > 100 
              ? Colors.white.withOpacity(0.95)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: _scrollPosition > 100
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScaleInWidget(
              delay: 0,
              scale: 0.5,
              child: Container(
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
            ),
            const SizedBox(width: 12),
            SlideUpWidget(
              delay: 200,
              child: Text(
                t('hostel_name'),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: _scrollPosition > 100 
                      ? const Color(0xFF1A237E)
                      : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        ..._buildDesktopNavItems(),
        _buildLanguageSelector(),
        const SizedBox(width: 20),
      ],
    );
  }
  
  List<Widget> _buildDesktopNavItems() {
    final navItems = [
      {'label': t('welcome'), 'key': _heroKey},
      {'label': t('rooms'), 'key': _roomsKey},
      {'label': t('amenities'), 'key': _amenitiesKey},
      {'label': t('gallery'), 'key': _galleryKey},
      {'label': t('location_title'), 'key': _locationKey},
      {'label': t('testimonials'), 'key': _testimonialsKey},
      {'label': t('contact'), 'key': _contactKey},
    ];
    
    return navItems.map((item) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: RippleButton(
          onTap: () => _scrollToSection(item['key'] as GlobalKey),
          rippleColor: const Color(0xFF1A237E).withOpacity(0.1),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              item['label'] as String,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: _scrollPosition > 100 
                    ? const Color(0xFF1A237E)
                    : Colors.white,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }
  
  Widget _buildLanguageSelector() {
    return ScaleInWidget(
      delay: 400,
      child: PopupMenuButton<Language>(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(_scrollPosition > 100 ? 1.0 : 0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _scrollPosition > 100 
                  ? const Color(0xFF1A237E).withOpacity(0.3)
                  : Colors.white.withOpacity(0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.language, 
                size: 16, 
                color: _scrollPosition > 100 
                    ? const Color(0xFF1A237E)
                    : Colors.white,
              ),
              const SizedBox(width: 4),
              Text(
                _getLanguageCode(_currentLanguage),
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: _scrollPosition > 100 
                      ? const Color(0xFF1A237E)
                      : Colors.white,
                ),
              ),
            ],
          ),
        ),
        onSelected: _changeLanguage,
        itemBuilder: (context) => Language.values.map((lang) {
          return PopupMenuItem(
            value: lang,
            child: Row(
              children: [
                Text(_getLanguageFlag(lang)),
                const SizedBox(width: 12),
                Text(
                  _getLanguageName(lang),
                  style: GoogleFonts.poppins(
                    color: _currentLanguage == lang
                        ? const Color(0xFF1A237E)
                        : Colors.black87,
                    fontWeight: _currentLanguage == lang
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
  
  String _getLanguageCode(Language lang) {
    switch (lang) {
      case Language.english: return 'EN';
      case Language.thai: return 'TH';
      case Language.russian: return 'RU';
      case Language.chinese: return 'CN';
    }
  }
  
  String _getLanguageFlag(Language lang) {
    switch (lang) {
      case Language.english: return '🇬🇧';
      case Language.thai: return '🇹🇭';
      case Language.russian: return '🇷🇺';
      case Language.chinese: return '🇨🇳';
    }
  }
  
  String _getLanguageName(Language lang) {
    switch (lang) {
      case Language.english: return 'English';
      case Language.thai: return 'ไทย';
      case Language.russian: return 'Русский';
      case Language.chinese: return '中文';
    }
  }
  
  Widget _buildMobileAppBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(_scrollPosition > 50 ? 0.7 : 0.5),
              Colors.transparent,
            ],
          ),
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) => ScaleInWidget(
              delay: 0,
              child: IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
          title: SlideUpWidget(
            delay: 100,
            child: Row(
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
          ),
          actions: [
            _buildLanguageSelector(),
          ],
        ),
      ),
    );
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
                ScaleInWidget(
                  delay: 0,
                  child: Container(
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
                ),
                const SizedBox(height: 12),
                SlideUpWidget(
                  delay: 100,
                  child: Text(
                    t('hostel_name'),
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                SlideUpWidget(
                  delay: 200,
                  child: Text(
                    t('tagline'),
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ..._buildMobileDrawerItems(),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RippleButton(
              onTap: () {
                Navigator.pop(context);
                _showBookingDialog();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1A237E), Color(0xFF3949AB)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.calendar_today, size: 20, color: Colors.white),
                    const SizedBox(width: 8),
                    Text(
                      t('book_now'),
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  List<Widget> _buildMobileDrawerItems() {
    final items = [
      {'icon': Icons.home, 'label': t('welcome'), 'key': _heroKey},
      {'icon': Icons.bed, 'label': t('rooms'), 'key': _roomsKey},
      {'icon': Icons.spa, 'label': t('amenities'), 'key': _amenitiesKey},
      {'icon': Icons.photo_library, 'label': t('gallery'), 'key': _galleryKey},
      {'icon': Icons.location_on, 'label': t('location_title'), 'key': _locationKey},
      {'icon': Icons.star, 'label': t('testimonials'), 'key': _testimonialsKey},
      {'icon': Icons.phone, 'label': t('contact'), 'key': _contactKey},
    ];
    
    return items.map((item) {
      final index = items.indexOf(item);
      return SlideUpWidget(
        delay: 300 + (index * 100),
        child: ListTile(
          leading: Icon(item['icon'] as IconData, color: const Color(0xFF1A237E)),
          title: Text(item['label'] as String),
          onTap: () {
            Navigator.pop(context);
            _scrollToSection(item['key'] as GlobalKey);
          },
        ),
      );
    }).toList();
  }
  
  Widget _buildMobileBottomNav() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      transform: Matrix4.translationValues(0, _isScrolling ? 100 : 0, 0),
      child: Container(
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
      ),
    );
  }
  
  Widget _buildBottomNavItem(IconData icon, String label, GlobalKey key) {
    return RippleButton(
      onTap: () => _scrollToSection(key),
      rippleColor: const Color(0xFF1A237E).withOpacity(0.1),
      child: Column(
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
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final isMobile = MediaQuery.of(context).size.width < 768;
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: isMobile ? null : _buildDesktopAppBar(),
      drawer: isMobile ? _buildMobileDrawer() : null,
      floatingActionButton: _buildFloatingActionButton(isMobile),
      body: Stack(
        children: [
          // Parallax background
          _buildParallaxBackground(),
          
          // Main content
          NotificationListener<ScrollUpdateNotification>(
            onNotification: (notification) {
              return false;
            },
            child: ListView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                // Hero Section
                HeroSection(
                  key: _heroKey,
                  t: t,
                  onBookNow: () => _scrollToSection(_roomsKey),
                  parallaxAnimation: _parallaxAnimation,
                  floatController: _floatController,
                  scrollPercentage: _scrollPercentage,
                ),
                
                // Rooms Section
                FadeInSection(
                  key: _roomsKey,
                  delay: 200,
                  child: RoomsSection(
                    t: t,
                    onBookNow: _showBookingDialog,
                  ),
                ),
                
                // Amenities Section
                FadeInSection(
                  key: _amenitiesKey,
                  delay: 400,
                  child: AmenitiesSection(t: t),
                ),
                
                // Gallery Section
                FadeInSection(
                  key: _galleryKey,
                  delay: 600,
                  child: GallerySection(t: t),
                ),
                
                // Location Section
                FadeInSection(
                  key: _locationKey,
                  delay: 800,
                  child: LocationSection(t: t),
                ),
                
                // Testimonials Section
                FadeInSection(
                  key: _testimonialsKey,
                  delay: 1000,
                  child: TestimonialsSection(t: t),
                ),
                
                // Contact Section
                FadeInSection(
                  key: _contactKey,
                  delay: 1200,
                  child: ContactSection(t: t),
                ),
                
                // Footer
                FooterSection(t: t),
              ],
            ),
          ),
          
          // Mobile App Bar
          if (isMobile) _buildMobileAppBar(),
          
          // Desktop indicators
          if (!isMobile) ...[
            // Scroll indicator
            Positioned(
              left: 20,
              top: MediaQuery.of(context).size.height * 0.5 - 50,
              child: ScrollIndicator(scrollController: _scrollController),
            ),
            
            // Section indicator
            Positioned(
              right: 20,
              top: MediaQuery.of(context).size.height * 0.5 - 100,
              child: SectionIndicator(
                sections: sections,
                scrollController: _scrollController,
              ),
            ),
          ],
        ],
      ),
      bottomNavigationBar: isMobile ? _buildMobileBottomNav() : null,
    );
  }
}

// Enhanced Hero Section
class HeroSection extends StatelessWidget {
  final String Function(String) t;
  final VoidCallback onBookNow;
  final Animation<double> parallaxAnimation;
  final AnimationController floatController;
  final double scrollPercentage;

  const HeroSection({
    Key? key,
    required this.t,
    required this.onBookNow,
    required this.parallaxAnimation,
    required this.floatController,
    required this.scrollPercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF1A237E).withOpacity(0.9 - scrollPercentage * 0.2),
            const Color(0xFF3949AB).withOpacity(0.7 - scrollPercentage * 0.2),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Animated background with parallax
          AnimatedBuilder(
            animation: parallaxAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, parallaxAnimation.value * 20),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=1920&auto=format&fit=crop',
                      ),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4 - scrollPercentage * 0.1),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          // Floating elements
          ...List.generate(5, (index) {
            return AnimatedBuilder(
              animation: floatController,
              builder: (context, child) {
                return Positioned(
                  left: (index * 150) % MediaQuery.of(context).size.width,
                  top: 100 + sin((floatController.value + index * 0.5) * 2 * pi) * 50,
                  child: Opacity(
                    opacity: 0.1,
                    child: Container(
                      width: 80 + index * 20,
                      height: 80 + index * 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),

          // Main content
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badge
                  SlideUpWidget(
                    delay: 0,
                    offset: 50,
                    child: ScaleInWidget(
                      delay: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white.withOpacity(0.3)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ShimmerEffect(
                              duration: const Duration(seconds: 3),
                              child: Icon(Icons.star, color: Colors.yellow[300], size: 14),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              t('featured').toUpperCase(),
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Title
                  SlideUpWidget(
                    delay: 200,
                    offset: 50,
                    child: Text(
                      t('hostel_name'),
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: isMobile ? 42 : 64,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Tagline
                  SlideUpWidget(
                    delay: 400,
                    offset: 50,
                    child: Text(
                      t('tagline'),
                      style: GoogleFonts.poppins(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: isMobile ? 18 : 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Location
                  SlideUpWidget(
                    delay: 600,
                    offset: 50,
                    child: Row(
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
                  ),
                  const SizedBox(height: 48),

                  // CTA Buttons
                  SlideUpWidget(
                    delay: 800,
                    offset: 50,
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        // Book Now Button
                        RippleButton(
                          onTap: onBookNow,
                          rippleColor: const Color(0xFF1A237E),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 32 : 48,
                              vertical: isMobile ? 16 : 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              t('book_now'),
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: isMobile ? 16 : 18,
                                color: const Color(0xFF1A237E),
                              ),
                            ),
                          ),
                        ),

                        // Explore Button
                        RippleButton(
                          onTap: () {},
                          rippleColor: Colors.white,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 24 : 40,
                              vertical: isMobile ? 16 : 20,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Text(
                              t('explore'),
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: isMobile ? 16 : 18,
                                color: Colors.white,
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

          // Scroll indicator
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: floatController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, sin(floatController.value * 2 * pi) * 5),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Enhanced Rooms Section
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
          SlideUpWidget(
            delay: 0,
            child: Column(
              children: [
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
              ],
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
        SlideUpWidget(
          delay: 200,
          child: EnhancedRoomCard(
            title: t('dormitory'),
            subtitle: t('most_popular'),
            price: '฿450',
            features: t('dorm_features'),
            image: 'https://images.unsplash.com/photo-1560185893-a55cbc8c57e8?w=800',
            t: t,
            onBookNow: () => onBookNow(roomName: t('dormitory')),
            isFeatured: true,
          ),
        ),
        const SizedBox(height: 32),
        SlideUpWidget(
          delay: 400,
          child: EnhancedRoomCard(
            title: t('private_room'),
            subtitle: t('best_value'),
            price: '฿1,200',
            features: t('private_features'),
            image: 'https://images.unsplash.com/photo-1615873968403-89e068629265?w=800',
            t: t,
            onBookNow: () => onBookNow(roomName: t('private_room')),
            isFeatured: false,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopRooms() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideUpWidget(
          delay: 200,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: EnhancedRoomCard(
                title: t('dormitory'),
                subtitle: t('most_popular'),
                price: '฿450',
                features: t('dorm_features'),
                image: 'https://images.unsplash.com/photo-1560185893-a55cbc8c57e8?w=800',
                t: t,
                onBookNow: () => onBookNow(roomName: t('dormitory')),
                isFeatured: true,
              ),
            ),
          ),
        ),
        SlideUpWidget(
          delay: 400,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: EnhancedRoomCard(
                title: t('private_room'),
                subtitle: t('best_value'),
                price: '฿1,200',
                features: t('private_features'),
                image: 'https://images.unsplash.com/photo-1615873968403-89e068629265?w=800',
                t: t,
                onBookNow: () => onBookNow(roomName: t('private_room')),
                isFeatured: false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EnhancedRoomCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String price;
  final String features;
  final String image;
  final String Function(String) t;
  final VoidCallback onBookNow;
  final bool isFeatured;

  const EnhancedRoomCard({
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
  State<EnhancedRoomCard> createState() => _EnhancedRoomCardState();
}

class _EnhancedRoomCardState extends State<EnhancedRoomCard> 
    with SingleTickerProviderStateMixin {
  late AnimationController _hoverController;
  late Animation<double> _scale;
  late Animation<double> _shadow;
  late Animation<double> _border;
  bool _isHovered = false;
  
  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scale = Tween<double>(begin: 1.0, end: 1.03).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );
    _shadow = Tween<double>(begin: 20, end: 40).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );
    _border = Tween<double>(begin: 0.2, end: 0.4).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );
  }
  
  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }
  
  void _handleHover(bool hover) {
    setState(() => _isHovered = hover);
    if (hover) {
      _hoverController.forward();
    } else {
      _hoverController.reverse();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    
    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: AnimatedBuilder(
        animation: _hoverController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scale.value,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1A237E).withOpacity(0.1 + _shadow.value / 200),
                    blurRadius: _shadow.value,
                    offset: Offset(0, 8 + _hoverController.value * 7),
                  ),
                ],
                border: Border.all(
                  color: widget.isFeatured
                      ? const Color(0xFF1A237E).withOpacity(_border.value)
                      : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image with hover zoom
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          height: 250,
                          width: double.infinity,
                          child: AnimatedScale(
                            duration: const Duration(milliseconds: 500),
                            scale: _isHovered ? 1.05 : 1.0,
                            child: Image.network(
                              widget.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Gradient overlay
                        Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.2),
                              ],
                            ),
                          ),
                        ),
                        // Featured badge
                        if (widget.isFeatured)
                          Positioned(
                            top: 16,
                            left: 16,
                            child: ScaleInWidget(
                              delay: 0,
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
                          ),
                      ],
                    ),
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
                            ScaleInWidget(
                              delay: 300,
                              child: Text(
                                '${widget.price}${widget.t('per_night')}',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF1A237E),
                                ),
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
                              child: RippleButton(
                                onTap: () {},
                                rippleColor: const Color(0xFF1A237E),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xFF1A237E)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      widget.t('view_room'),
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFF1A237E),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: RippleButton(
                                onTap: widget.onBookNow,
                                rippleColor: const Color(0xFF1A237E),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFF1A237E), Color(0xFF3949AB)],
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      widget.t('book_now'),
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
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
        },
      ),
    );
  }
}

// Enhanced Amenities Section
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
          SlideUpWidget(
            delay: 0,
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
              ],
            ),
          ),
          const SizedBox(height: 48),

          // Grid with staggered animation
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 2 : 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1,
            children: [
              _buildAmenityCard(0, Icons.wifi, t('free_wifi')),
              _buildAmenityCard(1, Icons.work, t('co_work')),
              _buildAmenityCard(2, Icons.roofing, t('rooftop')),
              _buildAmenityCard(3, Icons.kitchen, t('kitchen')),
              _buildAmenityCard(4, Icons.local_laundry_service, t('laundry')),
              _buildAmenityCard(5, Icons.people, t('lounge')),
              _buildAmenityCard(6, Icons.directions_bike, t('bike_rental')),
              _buildAmenityCard(7, Icons.local_parking, t('parking')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAmenityCard(int index, IconData icon, String title) {
    return SlideUpWidget(
      delay: 200 + (index * 100),
      offset: 30,
      child: ScaleInWidget(
        delay: 200 + (index * 100),
        scale: 0.7,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
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
                ScaleInWidget(
                  delay: 300 + (index * 100),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF1A237E), Color(0xFF3949AB)],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: Colors.white, size: 32),
                  ),
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
          ),
        ),
      ),
    );
  }
}

// Enhanced Gallery Section
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
          SlideUpWidget(
            delay: 0,
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
              ],
            ),
          ),
          const SizedBox(height: 48),

          // Gallery Grid
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
              return SlideUpWidget(
                delay: 200 + (index * 100),
                offset: 50,
                child: ScaleInWidget(
                  delay: 200 + (index * 100),
                  scale: 0.8,
                  child: _buildGalleryItem(index),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryItem(int index) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Image.network(
                _getGalleryImage(index),
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
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
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.5),
                    ],
                  ),
                ),
              ),
              const Positioned(
                bottom: 16,
                right: 16,
                child: Icon(
                  Icons.zoom_in,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
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

// Enhanced Location Section
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
          SlideUpWidget(
            delay: 0,
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
              ],
            ),
          ),
          const SizedBox(height: 48),

          // Location Content
          SlideUpWidget(
            delay: 200,
            child: Container(
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
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLocation() {
    return Column(
      children: [
        // Map Preview
        RippleButton(
          onTap: () => p29LaunchUrl('https://maps.app.goo.gl/3sBK1soZc17SryyaA'),
          rippleColor: const Color(0xFF1A237E),
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
              child: ScaleInWidget(
                delay: 0,
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
                  _buildLocationFeature(0, Icons.train, t('bts'), '5 min walk'),
                  _buildLocationFeature(1, Icons.shopping_cart, t('malls'), '10 min'),
                  _buildLocationFeature(2, Icons.nightlife, t('nightlife'), '15 min'),
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
          child: RippleButton(
            onTap: () => p29LaunchUrl('https://maps.app.goo.gl/3sBK1soZc17SryyaA'),
            rippleColor: const Color(0xFF1A237E),
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
                child: ScaleInWidget(
                  delay: 0,
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
        ),

        // Location Info
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SlideUpWidget(
                  delay: 300,
                  child: Text(
                    t('address'),
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A237E),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SlideUpWidget(
                  delay: 400,
                  child: Text(
                    t('address_full'),
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF555555),
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    _buildLocationFeature(0, Icons.train, t('bts'), '5 min walk'),
                    _buildLocationFeature(1, Icons.shopping_cart, t('malls'), '10 min'),
                    _buildLocationFeature(2, Icons.nightlife, t('nightlife'), '15 min'),
                  ],
                ),
                const SizedBox(height: 40),
                SlideUpWidget(
                  delay: 500,
                  child: RippleButton(
                    onTap: () => p29LaunchUrl('https://maps.app.goo.gl/3sBK1soZc17SryyaA'),
                    rippleColor: const Color(0xFF1A237E),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF1A237E), Color(0xFF3949AB)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Get Directions',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationFeature(int index, IconData icon, String title, String distance) {
    return SlideUpWidget(
      delay: 600 + (index * 100),
      child: ScaleInWidget(
        delay: 600 + (index * 100),
        scale: 0.8,
        child: Container(
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
        ),
      ),
    );
  }
}

// Enhanced Testimonials Section
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
          SlideUpWidget(
            delay: 0,
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
              ],
            ),
          ),
          const SizedBox(height: 48),

          // Testimonials Carousel
          SizedBox(
            height: isMobile ? 400 : 300,
            child: PageView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 48),
                  child: SlideUpWidget(
                    delay: 200 + (index * 200),
                    child: TestimonialCard(index: index),
                  ),
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

    return ScaleInWidget(
      delay: 300 + (index * 200),
      scale: 0.9,
      child: Card(
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
                  ScaleInWidget(
                    delay: 400 + (index * 200),
                    child: Container(
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
                      (i) => ScaleInWidget(
                        delay: 500 + (i * 100) + (index * 200),
                        child: Icon(
                          i < (testimonial['rating'] as int) ? Icons.star : Icons.star_border,
                          color: const Color(0xFFFFB800),
                          size: 20,
                        ),
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
      ),
    );
  }
}

// Enhanced Contact Section
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
          SlideUpWidget(
            delay: 0,
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
              ],
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
        _buildContactCard(0, Icons.location_on, t('address'), t('address_full'), () {
          Clipboard.setData(ClipboardData(text: t('address_full')));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(t('address_copied')),
              backgroundColor: const Color(0xFF1A237E),
            ),
          );
        }),
        const SizedBox(height: 20),
        _buildContactCard(1, Icons.phone, t('phone'), '+66 90 123 4567', () {
          Clipboard.setData(const ClipboardData(text: '+66901234567'));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(t('phone_copied')),
              backgroundColor: const Color(0xFF1A237E),
            ),
          );
        }),
        const SizedBox(height: 20),
        _buildContactCard(2, Icons.email, t('email'), 'info@p29hostel.com', () {
          Clipboard.setData(const ClipboardData(text: 'info@p29hostel.com'));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(t('email_copied')),
              backgroundColor: const Color(0xFF1A237E),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildDesktopContact(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildContactCard(0, Icons.location_on, t('address'), t('address_full'), () {
          Clipboard.setData(ClipboardData(text: t('address_full')));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(t('address_copied')),
              backgroundColor: const Color(0xFF1A237E),
            ),
          );
        }),
        const SizedBox(width: 24),
        _buildContactCard(1, Icons.phone, t('phone'), '+66 90 123 4567', () {
          Clipboard.setData(const ClipboardData(text: '+66901234567'));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(t('phone_copied')),
              backgroundColor: const Color(0xFF1A237E),
            ),
          );
        }),
        const SizedBox(width: 24),
        _buildContactCard(2, Icons.email, t('email'), 'info@p29hostel.com', () {
          Clipboard.setData(const ClipboardData(text: 'info@p29hostel.com'));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(t('email_copied')),
              backgroundColor: const Color(0xFF1A237E),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildContactCard(
    int index,
    IconData icon,
    String title,
    String content,
    VoidCallback onLongPress,
  ) {
    return SlideUpWidget(
      delay: 200 + (index * 100),
      child: ScaleInWidget(
        delay: 200 + (index * 100),
        scale: 0.8,
        child: RippleButton(
          onTap: () {
            if (icon == Icons.phone) {
              p29LaunchUrl('tel:+66901234567');
            } else if (icon == Icons.email) {
              p29LaunchUrl('mailto:info@p29hostel.com');
            } else if (icon == Icons.location_on) {
              p29LaunchUrl('https://maps.app.goo.gl/3sBK1soZc17SryyaA');
            }
          },
          rippleColor: const Color(0xFF1A237E),
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
                ScaleInWidget(
                  delay: 300 + (index * 100),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF1A237E), Color(0xFF3949AB)],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: Colors.white, size: 32),
                  ),
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
        ),
      ),
    );
  }
}

// Enhanced Footer Section
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
          SlideUpWidget(
            delay: 0,
            child: Column(
              children: [
                ScaleInWidget(
                  delay: 0,
                  child: Container(
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
          ),
          const SizedBox(height: 40),

          // Social Media
          SlideUpWidget(
            delay: 200,
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                _buildSocialIcon(0, Icons.photo_camera, () {
                  p29LaunchUrl('https://instagram.com/p29hostel');
                }),
                _buildSocialIcon(1, Icons.facebook, () {
                  p29LaunchUrl('https://facebook.com/p29hostel');
                }),
                _buildSocialIcon(2, Icons.music_note, () {
                  p29LaunchUrl('https://tiktok.com/@p29hostel');
                }),
                _buildSocialIcon(3, Icons.chat, () {
                  p29LaunchUrl('https://line.me/R/ti/p/@p29hostel');
                }),
              ],
            ),
          ),
          const SizedBox(height: 40),

          // Quick Links
          SlideUpWidget(
            delay: 400,
            child: Wrap(
              spacing: 24,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                _buildFooterLink(0, t('rooms')),
                _buildFooterLink(1, t('amenities')),
                _buildFooterLink(2, t('location_title')),
                _buildFooterLink(3, t('contact')),
                _buildFooterLink(4, t('privacy_policy')),
                _buildFooterLink(5, t('terms_conditions')),
              ],
            ),
          ),
          const SizedBox(height: 40),
          const Divider(color: Colors.white24),
          const SizedBox(height: 24),
          SlideUpWidget(
            delay: 600,
            child: Text(
              '© ${DateTime.now().year} P29 Hostel Bangkok. ${t('all_rights_reserved')}',
              style: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(int index, IconData icon, VoidCallback onTap) {
    return ScaleInWidget(
      delay: 300 + (index * 100),
      child: RippleButton(
        onTap: onTap,
        rippleColor: Colors.white,
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
      ),
    );
  }

  Widget _buildFooterLink(int index, String text) {
    return ScaleInWidget(
      delay: 500 + (index * 100),
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
    );
  }
}

// Enhanced Booking Modal
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
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: ModalRoute.of(context)!.animation!,
        curve: Curves.easeOutCubic,
      )),
      child: Container(
        padding: EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Draggable handle
            ScaleInWidget(
              delay: 0,
              child: Container(
                width: 60,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Title
            SlideUpWidget(
              delay: 100,
              child: Text(
                t('choose_contact_method'),
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A237E),
                ),
              ),
            ),
            const SizedBox(height: 32),
            
            // Contact Options
            SlideUpWidget(
              delay: 200,
              child: _buildContactOption(
                0,
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
            ),
            const SizedBox(height: 20),
            SlideUpWidget(
              delay: 300,
              child: _buildContactOption(
                1,
                Icons.message,
                t('via_line'),
                '@p29hostel',
                () {
                  p29LaunchUrl('https://line.me/R/ti/p/@p29hostel');
                },
                Colors.green[700]!,
              ),
            ),
            const SizedBox(height: 32),
            SlideUpWidget(
              delay: 400,
              child: RippleButton(
                onTap: () => Navigator.pop(context),
                rippleColor: const Color(0xFF1A237E),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF1A237E)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    t('cancel'),
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF1A237E),
                      fontWeight: FontWeight.w500,
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

  Widget _buildContactOption(
    int index,
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
    Color color,
  ) {
    return ScaleInWidget(
      delay: 200 + (index * 100),
      child: RippleButton(
        onTap: onTap,
        rippleColor: color.withOpacity(0.1),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey[200]!),
          ),
          child: ListTile(
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
        ),
      ),
    );
  }
}