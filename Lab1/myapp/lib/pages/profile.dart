import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Application"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "../assets/images/image.jpg",
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: double.infinity,
            height: 20,
          ),
          Text(
            "Viranga Dilshan",
            style: GoogleFonts.iceberg(fontSize: 25),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Assassin's Creed",
            style: TextStyle(
                fontSize: 20,
                color: Colors.red,
                fontStyle: FontStyle.italic),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.mail),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.facebook),
            ],
          ),
        ],
      ),
    );
  }
}
