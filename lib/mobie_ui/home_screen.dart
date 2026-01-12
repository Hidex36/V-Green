import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TRANG CHỦ'),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.notifications_none), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBanner(),
            _buildCategories(),
            _buildSectionTitle("Sản Phẩm Nổi Bật"),
            _buildProductGrid(),
          ],
        ),
      ),
    );
  }

  // 1. Banner xanh phía trên
  Widget _buildBanner() {
    return Container(
      margin: EdgeInsets.all(16),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage('assets/banner.jpg'), // Thay bằng ảnh của bạn
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          "Nông Sản Sạch\nTừ Vườn Đến Bàn",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }

  // 2. Danh mục Icon tròn
  Widget _buildCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _categoryIcon(Icons.eco, "Rau củ"),
        _categoryIcon(Icons.shopping_basket, "Trái cây"),
        _categoryIcon(Icons.more_horiz, "Xem thêm"),
      ],
    );
  }

  Widget _categoryIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(child: Icon(icon)),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  // 3. Tiêu đề mục
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text("Xem tất cả", style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }

  // 4. Lưới sản phẩm (Grid)
  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Expanded(child: Image.network('https://via.placeholder.com/150')),
              Text("Tên sản phẩm"),
              Text("50.000đ", style: TextStyle(color: Colors.red)),
              ElevatedButton(onPressed: () {}, child: Text("Thêm")),
            ],
          ),
        );
      },
    );
  }
}