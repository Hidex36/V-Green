import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy chiều rộng màn hình để tính toán tỉ lệ
    double screenWidth = MediaQuery.of(context).size.width;
    bool isWeb = screenWidth > 800; // Định nghĩa ngưỡng Web là trên 800px

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: isWeb ? false : true, // Web để canh trái, Mobile canh giữa
        title: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1200,
          ), // Giới hạn khung nội dung
          child: Text(
            'V-GREEN',
            style: TextStyle(
              color: Colors.green[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1200,
          ), // Nội dung không bao giờ rộng quá 1200px
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: isWeb
                  ? screenWidth * 0.1
                  : 16, // Web thì thụt lề 10%, Mobile 16px
              vertical: 20,
            ),
            children: [
              // 1. Banner - Tỉ lệ 16:9 trên Mobile, hẹp hơn trên Web
              AspectRatio(
                aspectRatio: isWeb ? 4 / 1 : 16 / 7,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green[400]!, Colors.green[700]!],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      "NÔNG SẢN ĐÓNG GÓI CHẤT LƯỢNG CAO",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 2. Grid Sản phẩm - Thay đổi số cột dựa trên kích thước màn hình
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isWeb
                      ? 4
                      : 2, // Web hiện 4 cột, Mobile hiện 2 cột
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: 8,
                itemBuilder: (context, index) => _buildProductCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: Colors.green[50],
              child: const Center(
                child: Icon(Icons.inventory_2, size: 40, color: Colors.green),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hạt Điều Loại 1",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "150.000đ",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
