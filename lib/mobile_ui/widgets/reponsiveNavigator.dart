import 'package:flutter/material.dart';
import "package:v_green/mobile_ui/screens/home_screen.dart";

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

        final List<Widget> screens = [
          HomeScreen(isWeb: isWeb), // Home nhận isWeb từ Nav
          const Center(child: Text("Trang Sản Phẩm")),
          const Center(child: Text("Trang Đơn Hàng")),
          const Center(child: Text("Trang Tài Khoản")),
        ];

        return Scaffold(
          body: IndexedStack(index: _currentIndex, children: screens),
          // Truyền biến isWeb vào hàm để sử dụng
          appBar: isWeb ? _buildWebAppBar(isWeb) : _buildMobileAppBar(isWeb),
          bottomNavigationBar: isWeb ? null : _buildBottomNav(),
        );
      },
    );
  }

  // Các hàm build phải nằm bên trong class State này
PreferredSizeWidget _buildWebAppBar(bool isWeb) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      title: Row(
        children: [
          // 1. Logo nằm bên trái
          SizedBox(width: 120, child: _buildLogo(40)),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 400, // max width
                ), 
                child: _buildSearchBox(40),//height search
              ),
              const SizedBox(width: 20), //khoang cach search vs menu
              Row(children: _buildMenuWeb()),
              const SizedBox(width: 20), // khoang cach menu vs icon
              _buildWebActionButtons(),
            ],
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildMobileAppBar(bool isWeb) {
    return AppBar(
      backgroundColor: Colors.white70,
      elevation: 0.5,
      title: Row(
        children: [
          _buildLogo(35),
          const SizedBox(width: 30),// logo vs search
            Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),// max width search
                child: _buildSearchBox(36),
              ),
            ),
          ),
          const SizedBox(width: 30), // space search vs cart
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.green),
            onPressed: () {},// click cart
          ),
        ],
      ),
    );
  }

  // logo
  Widget _buildLogo(double height) {
    return Image.asset('assets/imgs/logo.png', height: height);
  }
//search
  Widget _buildSearchBox(double height) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[100], 
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.lightGreen),
      ),
      child: const TextField(
        textAlignVertical:
            TextAlignVertical.center,
        style: TextStyle(fontSize: 14, color: Colors.black87),
        decoration: InputDecoration(
          hintText: "Tìm kiếm sản phẩm...",
          hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 14),
          prefixIcon: Icon(Icons.search, color: Colors.green, size: 20),
          border: InputBorder.none, 
          contentPadding: EdgeInsets.zero, 
          isDense: true, 
        ),
      ),
    );
  }


//menu for web
  List<Widget> _buildMenuWeb() {
    List<String> labels = ["Trang Chủ", "Sản Phẩm", "Khuyến Mãi"];
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

//icon 
  Widget _buildWebActionButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Nút Giỏ hàng với Badge (Số lượng)
        Stack(
          alignment: Alignment.topRight,
          children: [
            IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black87,
              ),
              onPressed: () {},
              tooltip: "Giỏ hàng",
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Text(
                '2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
        // Nút Tài khoản
        IconButton(
          icon: Icon(
            Icons.account_circle_outlined,
            // Đổi màu nếu đang ở tab Tài khoản (Index 3)
            color: _currentIndex == 3 ? Colors.green : Colors.black87,
          ),
          onPressed: () => _onItemTapped(3),
          tooltip: "Tài khoản của tôi",
        ),
      ],
    );
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
