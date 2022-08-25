import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_via_plant/modules/scan/result.dart';
import 'package:la_via_plant/shared/components/components.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanqrCode extends StatefulWidget {
  @override
  State<ScanqrCode> createState() => _ScanqrCodeState();
}

class _ScanqrCodeState extends State<ScanqrCode> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;
  Barcode? barcode;

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body: Stack(
          alignment: Alignment.center,
          children: [
            buildQrView(context),
           if(barcode != null)
             Positioned(
              child: buildResult(),
              bottom: 43.0,
        ),
      ]),
    );
  }

  Widget buildResult() => Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
          height: 75.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: HexColor('#FFFFFF').withOpacity(0.53),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                       '${barcode!.code}',
                      style: GoogleFonts.roboto(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: HexColor('#000000'),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Native to southern Africa',
                      style: GoogleFonts.roboto(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: HexColor('#000000'),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(width: 25.0,),
                FloatingActionButton(
                  onPressed: () {
                    navigationTo(context, ScanResult());
                  },
                  elevation: 0.0,
                  child: const Icon(
                      Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
  );

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: HexColor('#FFFFFF'),
          borderRadius: 4.0,
          borderLength: 80.0,
          borderWidth: 6.5,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );

  void onQRViewCreated(QRViewController qrController) {
    setState(() {
      this.qrController = qrController;
      this.qrController!.resumeCamera();
    });
    qrController.scannedDataStream.listen((event) {
      setState(() {
        barcode = event;
      });
    });
  }
}
