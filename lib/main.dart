import 'package:flutter/material.dart';
// 1. Kiểm tra lại đường dẫn này xem có đúng tên file bạn đã tạo không
import 'package:v_green/mobile_ui/screens/home_screen.dart';
import 'package:v_green/values/theme/theme.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Tắt cái nhãn Debug màu đỏ
      title: 'V-Green',
      theme: AppTheme.darkModeTheme,
      // 2. Gọi trực tiếp HomePage từ file home_screen.dart của bạn
      home: const HomeScreen(), 
    );
  }
}