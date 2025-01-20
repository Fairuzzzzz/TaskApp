import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Info",
          style: TextStyle(color: Color(0xFF9BD886)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/icons/Title.svg',
                width: 100,
                height: 100,
                color: Colors.green.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                  "   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lacinia blandit eleifend. Proin tristique lacus facilisis diam tempor, non congue justo faucibus."),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                  "     Nam scelerisque arcu a sapien facilisis, blandit pellentesque enim ornare. Donec vitae lacus commodo, vehicula erat et, molestie neque. Cras nec ornare augue. Quisque at condimentum elit, nec volutpat nulla."),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                  "     Suspendisse finibus nibh ac augue pulvinar, at laoreet lacus sollicitudin. Donec tempor, dui non imperdiet semper, sapien eros vulputate lectus, in euismod nisi ante a lacus."),
            ),
            SizedBox(height: 36),
            Text(
              "Contact Us:",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset('assets/icons/Phone.svg', width: 18, height: 18),
              SizedBox(
                width: 8,
              ),
              Text("+1 234 567 890")
            ]),
            SizedBox(
              height: 18,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset('assets/icons/Envelope.svg',
                  width: 18, height: 18),
              SizedBox(
                width: 8,
              ),
              Text("cs@freshlydropped.com")
            ]),
            SizedBox(height: 18),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset('assets/icons/ChatBubbleOvalLeftEllipsis.svg',
                  width: 18, height: 18),
              SizedBox(
                width: 8,
              ),
              Text("Live Agent")
            ]),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
