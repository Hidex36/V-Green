import 'package:flutter/material.dart';

class AppColors {
  // 1. Màu chủ đạo (Brand Colors)
  static const Color primary = Color(0xFF2E7D32); // Xanh lá đậm (Green 800)
  static const Color primaryLight = Color(0xFFE8F5E9); // Xanh lá cực nhạt cho Background
  static const Color primaryDark = Color(0xFF1B5E20); // Xanh lá tối cho Text quan trọng

  // 2. Màu nhấn (Accent/Secondary)
  static const Color accent = Color(0xFFFFA000); // Cam hổ phách (dùng cho Badge giảm giá, Sale)
  static const Color info = Color(0xFF2196F3); // Xanh dương cho thông báo

  // 3. Màu trung tính (Neutral - Dùng cho Text & Background)
  static const Color background = Color(0xFFF8F9FA); // Màu nền chính sạch sẽ
  static const Color card = Color(0xFFFFFFFF); // Màu nền cho thẻ (Card)
  static const Color textMain = Color(0xFF212121); // Màu chữ chính (Gần đen)
  static const Color textSecondary = Color(0xFF757575); // Màu chữ phụ (Xám)
  static const Color border = Color(0xFFE0E0E0); // Màu viền nhẹ

  // 4. Màu trạng thái (Status)
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFD32F2F);
  static const Color warning = Color(0xFFFFC107);

  // 5. Gradient (Dùng cho Banner)
  static const Gradient primaryGradient = LinearGradient(
    colors: [Color(0xFF66BB6A), Color(0xFF2E7D32)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}