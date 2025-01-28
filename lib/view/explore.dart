import 'package:flutter/material.dart';
import 'package:zack_shoping/view/bottombar.dart';
import 'package:zack_shoping/view/display.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  // Function to navigate to the ProductDisplayPage with the selected index
  void _navigateToProductDisplay(
      BuildContext context, int index, String category) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ProductDisplayPage(index: index, category: category),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    MainBottombar(
                  initialIndex: 0,
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // New Arrivals Section
            InkWell(
              onTap: () => _navigateToProductDisplay(context, 0, 'newarrival'),
              child: Container(
                color: Colors.black12.withOpacity(.1),
                height: 180,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          AssetImage('lib/Asset/image/cover_image/new.jpeg',),
                          
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Text(
                          'New Arrivals',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'Discover the Latest Styles\nat zack  Crafted for the Bold\nStyled for You.',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            InkWell(
              onTap: () => _navigateToProductDisplay(context, 0, 'sporty'),
              child: Container(
                color: Colors.black12.withOpacity(.1),
                height: 180,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          AssetImage('lib/Asset/image/cover_image/denim.jpeg'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Text(
                          'Denim Collection',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'Step into Timeless Style with\nPremium Denim. Made to Last\nStyled for You.',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            InkWell(
              onTap: () => _navigateToProductDisplay(context, 0, 'newarrival'),
              child: Container(
                color: Colors.black12.withOpacity(.1),
                height: 180,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          AssetImage('lib/Asset/image/cover_image/shoes.jpeg'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Text(
                          'Shoes & Sandals',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'Elevate Every Step with Luxe\nFootwear. Comfort Meets\nElegance.',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),

            // Sporty Section
            InkWell(
              onTap: () => _navigateToProductDisplay(context, 0, 'sporty'),
              child: Container(
                color: Colors.black12.withOpacity(.1),
                height: 180,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          AssetImage('lib/Asset/image/cover_image/sports.jpeg'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Text(
                          'Sportswear',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'Unleash Your Inner Athlete\nwith High-Performance\nStylish Activewear.',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
