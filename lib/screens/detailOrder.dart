import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Page',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: OrderPage(
        name: 'Latte', 
        image: 'assets/images/latte.png', 
        price: '3.80',
      ),
    );
  }
}

class OrderPage extends StatefulWidget {
  final String name;
  final String image;
  final String price;

  // Constructor to receive parameters
  OrderPage({
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
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Delivery Option
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFC67C4E),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Deliver',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Pick Up',
                      style: TextStyle(color: Color(0xFFC67C4E), fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Address
              Text(
                'Delivery Address',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Text(
                'Jl.kalapanunggal',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              Text(
                'Jl.Kalapanunggal RT.01, Palasari, Kab.Sukabumi.',
                style: TextStyle(fontSize: 12, color: Color(0xFF9B9B9B)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: BorderSide(color: Color(0xFFDEDEDE)),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.edit, size: 16),
                        SizedBox(width: 8),
                        Text('Edit Address', style: TextStyle(color: Color(0xFFC67C4E))),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: BorderSide(color: Color(0xFFDEDEDE)),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.note_add, size: 16),
                        SizedBox(width: 8),
                        Text('Add Note', style: TextStyle(color: Color(0xFFC67C4E))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Product Information
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

              // Discount Section
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Color(0xFFEAEAEA)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.discount, color: Color(0xFFC67C4E), size: 24),
                    SizedBox(width: 15),
                    Text('1 Discount is applied', style: TextStyle(color: Color(0xFF2F2D2C))),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 12),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Payment Summary
              Text(
                'Payment Summary',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Price', style: TextStyle(fontSize: 14)),
                  Text(widget.price, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Delivery Fee', style: TextStyle(fontSize: 14)),
                  Text('\$1.0', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Payment', style: TextStyle(fontSize: 14)),
                  Text('\$5.53', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFFC67C4E))),
                ],
              ),
              SizedBox(height: 20),

              // Payment Method
              Row(
                children: [
                  Icon(Icons.attach_money, size: 24),
                  SizedBox(width: 10),
                  Text('Cash', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  Spacer(),
                  Text('\$5.53', style: TextStyle(fontSize: 14)),
                  Icon(Icons.more_vert, size: 24),
                ],
              ),
              SizedBox(height: 20),

              // Order Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC67C4E),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  'Order',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
