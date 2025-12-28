import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String paymentType = 'online';
  String selectedMethod = 'PayPal';
  final accountController = TextEditingController();
  final amountController = TextEditingController();
  Color kPrimaryColor = Color(0xFF4B2E83);
  Color kBackgroundColor = Color(0xFFF6F3FB);
  double kBorderRadius = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
        title: Text('JobSeeker Payment Information\nAnd Completion',
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple.shade400,
                Colors.deepPurple.shade200,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionTitle('Payment Type'),
              _radioTile('Online Payment', 'online'),
              _radioTile('Cash Payment On Site', 'cash'),
              SizedBox(height: 16),
              _dropdown(),
              SizedBox(height: 20),
              _inputField(
                hint: 'Enter Account / Card Number',
                controller: accountController,
                icon: Icons.credit_card,
              ),
              SizedBox(height: 12),
              _inputField(
                hint: 'Enter Payment Here (For Online Payment)',
                controller: amountController,
                icon: Icons.attach_money,
              ),
              SizedBox(height: 24),
              _receiptSection(),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('SEND PAYMENT AND SAVE RECEIPT',
                    style: TextStyle(color: Colors.white,fontSize: 16, letterSpacing: 1),
                  ),
                ),
              ),
              SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _radioTile(String title, String value) {
    return RadioListTile(
      value: value,
      groupValue: paymentType,
      activeColor: kPrimaryColor,
      onChanged: (val) {
        setState(() => paymentType = val!);
      },
      title: Text(title),
    );
  }

  Widget _dropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kBorderRadius),
        border: Border.all(color: kPrimaryColor),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedMethod,
          isExpanded: true,
          items: [
            'PayPal',
            'MasterCard',
            'Orange Money',
            'Zain Cash',
            'Apple Pay',
          ].map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e),
            );
          }).toList(),
          onChanged: (val) {
            setState(() => selectedMethod = val!);
          },
        ),
      ),
    );
  }

  Widget _inputField({
    required String hint,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          borderSide: BorderSide(color: kPrimaryColor),
        ),
      ),
    );
  }

  Widget _receiptSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kBorderRadius),
        border: Border.all(color: kPrimaryColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Enter Receipt information (Important)\nfor Online Or Cash Payment',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          TextField(decoration: InputDecoration(hintText: 'Payment Date')),
          SizedBox(height: 8),
          TextField(decoration: InputDecoration(hintText: 'Payment Amount (For Cash Payment)')),
        ],
      ),
    );
  }
}