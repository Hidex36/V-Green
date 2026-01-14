import 'package:flutter/material.dart';

// Chuyển thành StatefulWidget để dùng được _currentIndex và setState
class Reponsivenavigator extends StatefulWidget {
  const Reponsivenavigator({super.key});

  @override
  State<Reponsivenavigator> createState() => _ReponsivenavigatorState();
}

class _ReponsivenavigatorState extends State<Reponsivenavigator> {
  // Khai báo các biến trạng thái bên trong State
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWeb = constraints.maxWidth > 800;

        return Scaffold(
          // Truyền biến isWeb vào hàm để sử dụng
          appBar: isWeb ? _buildWebAppBar(isWeb) : _buildMobileAppBar(isWeb),

          bottomNavigationBar: isWeb ? null : _buildBottomNav(),
        );
      },
    );
  }

  // Các hàm build phải nằm bên trong class State này
  PreferredSizeWidget _buildWebAppBar(bool isWeb) {
    return AppBar();
  }

  PreferredSizeWidget _buildMobileAppBar(bool isWeb) {
    return AppBar();
  }

  Widget _buildLogo(double height) {
    return Image.asset('assets/imgs/logo.png', height: height);
  }

  Widget _buildSearchBox() {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Tìm kiếm...",
          prefixIcon: Icon(Icons.search, size: 18),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(bottom: 12),
        ),
      ),
    );
  }

  List<Widget> _buildMenuWeb() {
    List<String> labels = ["Trang chủ", "Sản Phẩm", "Đơn hàng", "Tài Khoản"];
    return labels.asMap().entries.map((entry) {
      return TextButton(
        onPressed: () => _onItemTapped(entry.key),
        child: Text(
          entry.value,
          style: TextStyle(
            color: _currentIndex == entry.key ? Colors.green : Colors.black,
          ),
        ),
      );
    }).toList();
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
        BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: "Sản phẩm"),
        BottomNavigationBarItem(icon: Icon(Icons.receipt), label: "Đơn hàng"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Tôi"),
      ],
    );
  }
}
