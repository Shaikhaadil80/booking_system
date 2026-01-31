import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> commonLaunchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

Future<void> copyToClipboard(BuildContext context, String value, String label) async {
  await Clipboard.setData(ClipboardData(text: value));
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('$label copied!'),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
    ),
  );
}

void handleWhatsAppBooking(BuildContext context, {String? roomName}) async {
  const phone = '66902587401';
  final message = 'Hi, I want to book ${roomName ?? 'a room'}. Is it available?';
  final url = 'whatsapp://send?phone=$phone&text=${Uri.encodeComponent(message)}';
  
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    _showCopyDialog(phone, context);
  }
}

void _showCopyDialog(String phone, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: const Color(0xFFFFFBF7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text('WhatsApp Not Available', style: _boldText()),
      content: Text('Copy this number to contact us:\n\n$phone', style: _normalText()),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel', style: _interText(color: const Color(0xFF666666))),
        ),
        TextButton(
          onPressed: () {
            copyToClipboard(context, phone, 'Phone number');
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            backgroundColor: const Color(0xFFFF6B35),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          child: Text('Copy', style: _boldText(color: Colors.white)),
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