import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'News',
          style: GoogleFonts.poppins(
            fontSize: 24.0,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          height: 220.0,
          child: Stack(
            children: [
              Container(
                child: CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                  imageUrl:
                      'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              /*Container(
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),*/
              Positioned(
                top: 10.0,
                left: 10.0,
                child: Text(
                  'ODCs',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10.0,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  width: 80.0,
                  height: 40.0,
                  child: Row(
                    children: [
                      Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      Spacer(),
                      VerticalDivider(
                        thickness: 1.0,
                        color: Colors.white,
                      ),
                      Spacer(),
                      Icon(
                        Icons.copy_rounded,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    color: Colors.orange,
                  ),
                ),
              ),
              Positioned(
                bottom: 10.0,
                left: 10.0,
                child: Text(
                  'ODC Supports All Universities',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
