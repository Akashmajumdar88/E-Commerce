import 'package:account/providers/auth_provider.dart';
import 'package:account/providers/cibil_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'providers/login_provider.dart';
import 'views/auth/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB7gXKujCKQiKYMNtvn_Aeoe5pjtWMVcYQ",
          appId: "1:645490991210:android:20dd7b8f2fe216422e2a13",
          messagingSenderId: "645490991210",
          projectId: "mobistack-d79b1"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (context) => Auth_Provider()..checkLoginStats()),
            ChangeNotifierProvider(create: (context) => LoginProvider()),
            ChangeNotifierProvider(create: (context) => CibilProvider())
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          ),
        ));
  }
}


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/services.dart'; // For platform channel
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   bool isLocked = false;
//   static const platform = MethodChannel('device_control'); // Platform channel
//
//   @override
//   void initState() {
//     super.initState();
//     _listenToFirebase();
//   }
//
//   // 🔥 Listen to Firestore changes and trigger lock/unlock
//   void _listenToFirebase() {
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc('user_device_status')
//         .snapshots()
//         .listen((snapshot) async {
//       if (snapshot.exists) {
//         bool lockStatus = snapshot.data()?['isLocked'] ?? false;
//         setState(() {
//           isLocked = lockStatus;
//         });
//
//         if (lockStatus) {
//           _lockDevice(); // Lock device if isLocked = true
//         } else {
//           _unlockDevice(); // Unlock (remove restrictions) if isLocked = false
//         }
//       } else {
//         print("Document does not exist! Creating default document...");
//
//         // Create the document with a default value
//         await FirebaseFirestore.instance
//             .collection('users')
//             .doc('user_device_status')
//             .set({'isLocked': false});
//       }
//     }, onError: (error) {
//       print("Firestore Error: $error");
//     });
//   }
//
//
//   // 🔒 Lock device using Android DevicePolicyManager
//   void _lockDevice() async {
//     try {
//       await platform.invokeMethod('lockDevice');
//     } on PlatformException catch (e) {
//       print("Failed to lock device: '${e.message}'.");
//     }
//   }
//
//   // 🔓 Unlock device (not possible directly, but can remove restrictions)
//   void _unlockDevice() async {
//     try {
//       await platform.invokeMethod('unlockDevice');
//     } on PlatformException catch (e) {
//       print("Failed to unlock device: '${e.message}'.");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text(
//             isLocked
//                 ? "🔒 Your device is locked due to EMI non-payment."
//                 : "✅ Device is unlocked and usable.",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }


