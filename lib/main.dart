import 'package:booking_system/future_hostel_landing.dart';
import 'package:booking_system/pataya_bearch_house_app.dart';
import 'package:booking_system/stay_strays_hostel_landing.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() {
  // runApp(const PattayaBeachHouseApp());
  // runApp(const FutureHostelApp(),);
  // runApp(const StaysStraysHostelApp(),);
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
        '/': (context) => const HomePage(),
        // '/home': (context) => const MyHomePage(title: 'Home Page'),
        '/pattayabeachHouse': (context) => const PattayaBeachHouseApp(),
        '/futurehostel': (context) => const FutureHostelApp(),
        '/staystrayshostel': (context) => const StayStraysHostelApp(),
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
