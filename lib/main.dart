import 'package:booking_system/future_hostel_landing.dart';
import 'package:booking_system/p29_hostel_landing.dart';
import 'package:booking_system/pataya_bearch_house_app.dart';
import 'package:booking_system/stay_strays_hostel_landing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// void main() {
//   runApp(const MyApp());
// }
void main()async {
// await dotenv.load();

  WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: "AIzaSyD0doiKpevR5I2WuaVx3V-oHSF8EdIXxOk",
  authDomain: "staystrayshostel.firebaseapp.com",
  projectId: "staystrayshostel",
  storageBucket: "staystrayshostel.firebasestorage.app",
  messagingSenderId: "763601262306",
  appId: "1:763601262306:web:ad1a63fc94ff9fb932b0bb",
  measurementId: "G-NLQXKTB8D2"
  ));

  // runApp(const PattayaBeachHouseApp());
  // runApp(const FutureHostelApp(),);
  // runApp(const StaysStraysHostelApp(),);
  // runApp(const P29HostelApp(),);
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      // home: const MyHomePage(title: 'Home Page'),
      initialRoute: '/',
      routes: {
        // '/': (context) => const ImageUploadScreen(),
        '/': (context) => const HomePage(),
        // '/home': (context) => const MyHomePage(title: 'Home Page'),
        '/pattayabeachHouse': (context) => const PattayaBeachHouseApp(),
        '/futurehostel': (context) => const FutureHostelApp(),
        '/staystrayshostel': (context) => const StayStraysHostelApp(),
        '/p29hostel': (context) => const P29HostelApp(),
      },
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))), 
                ),
                child: SizedBox(
                  width: 150,
                  child: const Text('Pattaya Beach House')),
                onPressed: () => Navigator.pushNamed(context, '/pattayabeachHouse'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))), 
                ),
                child: SizedBox(
                  width: 150,
                  child: const Text('Future Hostel')),
                onPressed: () => Navigator.pushNamed(context, '/futurehostel'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))), 
                ),
                child: SizedBox(
                  width: 150,
                  child: const Text('Stay Strays Hostel')),
                onPressed: () => Navigator.pushNamed(context, '/staystrayshostel'),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton(
            //     style: ButtonStyle(
            //       shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))), 
            //     ),
            //     child: SizedBox(
            //       width: 150,
            //       child: const Text('P29 Hostel')),
            //     onPressed: () => Navigator.pushNamed(context, '/p29hostel'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
