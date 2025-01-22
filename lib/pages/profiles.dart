import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final safeHeight = size.height - padding.top - padding.bottom;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(color: Color(0xFF9BD886)),
        ),
        backgroundColor: Colors.white,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final isTablet = screenWidth > 600;

        final dynamicHeight = constraints.maxHeight * (isTablet ? 0.2589 : 0.3);
        final maxHeight = 300.0;
        final containerHeight = dynamicHeight.clamp(230.0, maxHeight);
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: safeHeight * 0.05,
              ),
              Center(
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey)),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                  height: containerHeight,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  padding: EdgeInsets.all(isTablet ? 24 : 16),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Personal Info",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/User.svg',
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black)),
                              Text(
                                "John Doe",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Envelope.svg',
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black)),
                              Text(
                                "johndoe@gmail.com",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Phone.svg',
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Phone Number",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black)),
                              Text(
                                "+1 234 567 890",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        );
      }),
      backgroundColor: Colors.white,
    );
  }
}
