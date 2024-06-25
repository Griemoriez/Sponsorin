import 'package:flutter/material.dart';

class ProfileCompanyAbout extends StatelessWidget {
  const ProfileCompanyAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
              side: const BorderSide(
                color: Colors.grey, // Ganti dengan warna border yang diinginkan
                width: 2.0,
              )),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PT Mandira',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Berdiri sejak tahun 1968, PT Mandiri telah menjadi Bank Swasta terbesar kedua di Indonesia. Berkomitmen untuk memberikan pelayanan terbaik kepada nasabah dan menjadi bank yang dapat dipercaya oleh seluruh nasabah.',
                ),
                SizedBox(height: 8.0),
                Text(
                  'Mandira terus bertumbuh dengan puluhan ribu karyawan yang tersebar di berbagai cabang yang ada di seluruh Indonesia.',
                ),
                SizedBox(height: 8.0),
                Text(
                  'Website',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 4.0),
                Text('http://www.mandira.co.id'),
                SizedBox(height: 8.0),
                Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 4.0),
                Text('mandira@gmail.co.id'),
                SizedBox(height: 8.0),
                Text(
                  'Nomor Telepon',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 4.0),
                Text('+6281123456789'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
