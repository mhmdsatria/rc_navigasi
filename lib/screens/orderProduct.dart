import 'package:flutter/material.dart';
import 'package:muhamadsatria/screens/detailOrder.dart';  // Ensure correct path

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DetailPage(  // Initial page of the app
        title: 'Cappuccino',
        imagePath: 'assets/cappuccino.jpg',  // Example image path
        price: '5.00',
        description: 'Delicious cappuccino with rich flavor.',
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final String imagePath;
  final String price;
  final String description;

  const DetailPage({
    super.key,
    required this.title,
    required this.imagePath,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF2F2D2C)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'DETAIL',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2F2D2C)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2F2D2C),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 20),
                  const SizedBox(width: 5),
                  const Text('4.8', style: TextStyle(fontSize: 16, color: Color(0xFF666666))),
                  const SizedBox(width: 5),
                  const Text('(230)', style: TextStyle(fontSize: 16, color: Color(0xFF666666))),
                  const SizedBox(width: 10),
                  const Icon(Icons.local_cafe, color: Color(0xFF666666), size: 20),
                  const SizedBox(width: 5),
                  const Icon(Icons.local_mall, color: Color(0xFF666666), size: 20),
                ],
              ),
              const SizedBox(height: 20),
              Text(description, style: const TextStyle(fontSize: 14, color: Color(0xFF9B9B9B))),
              const SizedBox(height: 20),
              const Text('Size', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2F2D2C))),
              const SizedBox(height: 10),
              Row(
                children: [
                  _buildSizeOption('S'),
                  _buildSizeOption('M'),
                  _buildSizeOption('L'),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFC67C4E)),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child:ElevatedButton(
                        onPressed: () {
                          // Navigasi ke OrderPage tanpa perubahan apapun
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderPage(
                                name: title,
                                image: imagePath,
                                price: price,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC67C4E),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Buy Now',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),

                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSizeOption(String size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFD1D1D1)),
        ),
        child: Center(
          child: Text(
            size,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2F2D2C)),
          ),
        ),
      ),
    );
  }
}

class OrderPage extends StatefulWidget {
  final String name;
  final String image;
  final String price;

  const OrderPage({
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Order',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2F2D2C),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF2F2D2C)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.image,
                      width: 54,
                      height: 54,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'with Chocolate',
                        style: TextStyle(fontSize: 12, color: Color(0xFF9B9B9B)),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: decrementQuantity,
                      ),
                      Text(
                        '$quantity',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: incrementQuantity,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Price', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(widget.price, style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Replace the OrderPage with PaymentPage after "Place Order" button is clicked
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(  // Redirect to PaymentPage
                          name: widget.name,
                          image: widget.image,
                          price: widget.price,
                          quantity: quantity,
                        ),
                      ),
                    );
                  },
                  child: Text('Place Order', style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC67C4E),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  final String name;
  final String image;
  final String price;
  final int quantity;

  const PaymentPage({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Page')),
      body: Center(
        child: Text('Proceed to Payment for $name'),
      ),
    );
  }
}
