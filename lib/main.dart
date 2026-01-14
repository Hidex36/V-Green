import 'package:flutter/material.dart';
// Đảm bảo đường dẫn này đúng với nơi bạn đặt file Navigator
import 'package:v_green/mobile_ui/widgets/reponsiveNavigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'V-GREEN',
      debugShowCheckedModeBanner: false, // Tắt nhãn "Debug" ở góc màn hình
      theme: ThemeData(
        useMaterial3: true, // Sử dụng giao diện Material 3 mới nhất
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      // ĐÂY LÀ ĐIỂM QUAN TRỌNG:
      // Navigator sẽ quản lý tất cả các trang, bao gồm cả Home
      home: const Reponsivenavigator(),
    );
  }
}
