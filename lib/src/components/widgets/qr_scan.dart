import 'package:flutter/material.dart';

class QRScan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) => SafeArea (
    child: Scaffold (
      body: Stack (
        alignment: Alignment.center,
        children: <Widget> [
          // buildQrView(context),
        ],
      ),
    ),
  );
}