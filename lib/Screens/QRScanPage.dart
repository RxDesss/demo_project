import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      // body:  MobileScanner(
      //   // fit: BoxFit.contain,
      //   controller: MobileScannerController(
      //     detectionSpeed: DetectionSpeed.normal,
      //     facing: CameraFacing.front,
      //     torchEnabled: true,
      //   ),
      //   onDetect: (capture) {
      //     final List<Barcode> barcodes = capture.barcodes;
      //     final Uint8List? image = capture.image;
      //     for (final barcode in barcodes) {
      //       debugPrint('Barcode found! ${barcode.rawValue}');
      //     }
      //   },
      // ),
    );
  }
}
