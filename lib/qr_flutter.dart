import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_image/qr_image.dart';

class QrScreen1 extends StatelessWidget {
  final Map<String, String> data;

  const QrScreen1({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Combine all data into a single string (for QR code content)
    String qrData = _buildQrData(data);

    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Wrap QrImage in a list
            QrImageView(
              data: qrData,
              version: QrVersions.auto,
              size: 200.0,
            ),
            const SizedBox(height: 20.0),
            Text(
              'Scan this QR Code',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  String _buildQrData(Map<String, String> data) {
    // Combine data into a single string formatted for QR code
    return '''
      Document Type: ${data['Document Type']}
      Document Country: ${data['Document Country']}
      Document Number: ${data['Document Number']}
      National ID number: ${data['National ID number']}
      Full Name: ${data['Full Name']}
      Address: ${data['Address']}
      Date of Birth: ${data['Date of Birth']}
      Starting Date: ${data['Starting Date']}
      End Date: ${data['End Date']}
      Blood Group: ${data['Blood Group']}
    ''';
  }
}
