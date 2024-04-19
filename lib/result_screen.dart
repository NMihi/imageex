import 'package:flutter/material.dart';
import 'package:imageex/qr_flutter.dart';

// class ResultScreen extends StatelessWidget{
//   final String text;

//   const ResultScreen({super.key,required this.text});

//   @override
//   Widget build(BuildContext context) => Scaffold(
//       appBar : AppBar(
//         title: const Text('Result'),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(30.0),
//         child: Text(text),
//       ),
//     );
// }

class ResultScreen extends StatefulWidget {
  final String text;

  const ResultScreen({Key? key, required this.text}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late Map<String, String> extractedData;

  @override
  void initState() {
    super.initState();
    // Extract and categorize data when the screen initializes
    extractedData = _extractData(widget.text);
  }

  Map<String, String> _extractData(String text) {
    // Implement your entity extraction logic here based on OCR text
    // This is a dummy implementation for illustration
    return {
      'Document Type': 'Driving Lisence',
      'Document Country': 'SriLanka',
      'Document Number': 'AB123456',
      'National ID number': '1234567890V',
      'Full Name': 'John Doe',
      'Address': '123 Main St, Anytown',
      'Date of Birth': '01/01/1990',
      'Starting Date': '01/01/2024',
      'End Date': '01/01/2029',
      'Blood Group': 'O+',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: extractedData.entries.map((entry) {
            return _buildDataField(entry.key, entry.value);
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to edit screen passing the extracted data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditScreen(data: extractedData),
                  ),
                );
              },
              child: Text('Edit'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to QR screen passing the extracted data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QrScreen1(data: extractedData),
                  ),
                );
              },
              child: Text('Submit as QR'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataField(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(value),
      ),
    );
  }
}

class EditScreen extends StatelessWidget {
  final Map<String, String> data;

  const EditScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implement edit screen UI to allow editing of extracted data
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Data'),
      ),
      body: Center(
        child: Text('Implement Edit Screen Here'),
      ),
    );
  }
}

class QrScreen extends StatelessWidget {
  final Map<String, String> data;

  const QrScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Generate QR code using data and display it
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
      ),
      body: Center(
        child: Text('Implement QR Code Generation Here'),
      ),
    );
  }
}
