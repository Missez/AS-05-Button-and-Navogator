import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Info App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.teal[50], 
      ),
      home: HomePage(),
      routes: {
        '/term1': (_) => TermPage(term: 1),
        '/term2': (_) => TermPage(term: 2),
        '/term3': (_) => TermPage(term: 3),
        '/term4': (_) => TermPage(term: 4),
        '/term5': (_) => TermPage(term: 5),
        '/outcome': (_) => OutcomePage(),
        '/profile': (_) => ProfilePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  Widget menuButton(BuildContext context, String title, String route, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: SizedBox(
        width: 260,
        child: ElevatedButton.icon(
          icon: Icon(icon, size: 24),
          label: Text(title, style: TextStyle(fontSize: 18)),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: Colors.teal[400],
            foregroundColor: Colors.white,
            elevation: 4,
          ),
          onPressed: () => Navigator.pushNamed(context, route),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าแรก', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.teal[700],
      ),
      body: Center(
        child: Card(
          elevation: 12,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          margin: EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.school, color: Colors.teal, size: 60),
                SizedBox(height: 16),
                Text(
                  'เมนูหลัก',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.teal[800]),
                ),
                SizedBox(height: 24),
                menuButton(context, 'ผลการเรียน เทอม 1', '/term1', Icons.looks_one),
                menuButton(context, 'ผลการเรียน เทอม 2', '/term2', Icons.looks_two),
                menuButton(context, 'ผลการเรียน เทอม 3', '/term3', Icons.looks_3),
                menuButton(context, 'ผลการเรียน เทอม 4', '/term4', Icons.looks_4),
                menuButton(context, 'ผลการเรียน เทอม 5', '/term5', Icons.looks_5),
                Divider(height: 32, thickness: 1),
                menuButton(context, 'ผลลัพธ์การเรียนรู้', '/outcome', Icons.emoji_objects),
                menuButton(context, 'โปรไฟล์ส่วนตัว', '/profile', Icons.person),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TermPage extends StatelessWidget {
  final int term;
  const TermPage({Key? key, required this.term}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ข้อมูลแต่ละเทอม
    final subjectData = {
      1: {
        'subjects': ['แก่นวิศวกรรมซอฟต์แวร์', 'วิศวกรรมซอฟต์แวร์เบื้องต้น', 'การสื่อสารข้อมูลและเครือข่าย'],
        'grades':   ['A', 'A', 'A'],
      },
      2: {
        'subjects': [
          'ระบบปฏิบัติการและการจัดโครงแบบเครื่องแม่ข่าย',
          'การประมวลผลภาพดิจิทัล และการมองเห็นโดยคอมพิวเตอร์',
          'คอมพิวเตอร์ช่วยในงานวิศวกรรมและการผลิต',
          'การเขียนโปรแกรมสำหรับวิศวกรซอฟต์แวร์',
          'ภาษาอังกฤษเชิงวิชาการ',
          'โครงสร้างข้อมูลและขั้นตอนวิธี',
          'โครงสร้างและสถาปัตยกรรมคอมพิวเตอร์',
          'การกำหนดความต้องการและการออกแบบทางซอฟต์แวร์'
        ],
        'grades':   ['A', 'A', 'A', 'A', 'A', 'B', 'A', 'B+'],
      },
      3: {
        'subjects': [
          'คณิตศาสตร์ดิสครีต',
          'ความน่าจะเป็นและสถิติในงานวิศวกรรม',
          'การเขียนโปรแกรมเชิงวัตถุ',
          'กระบวนการซอฟต์แวร์และการประกันคุณภาพ',
          'สถาปัตยกรรมซอฟต์แวร์',
          'ระบบฝังตัวและระบบอินเทอร์เน็ตในทุกสิ่ง'
        ],
        'grades':   ['B', 'A', 'B', 'A', 'A', 'A'],
      },
      4: {
        'subjects': [
          'พีชคณิตเชิงเส้นสำหรับวิศวกรรม',
          'การวิเคราะห์และออกแบบระบบ',
          'การจัดการโครงการซอฟต์แวร์',
          'สัมมนาทางวิศวกรรมซอฟต์แวร์',
          'คลังข้อมูลและเหมืองข้อมูล',
          'วิวัฒนาการซอฟต์แวร์และการบำรุงรักษา'
        ],
        'grades':   ['A', 'A', 'A', 'A', 'B', 'A'],
      },
      5: {
        'subjects': [
          'โครงงานทางวิศวกรรมซอฟต์แวร์',
          'การออกแบบกราฟิกเพื่อการนำเสนอ',
          'วิศวกรรมเทคโนโลยีสื่อประสมและแอนิเมชัน',
          'การเตรียมสหกิจศึกษาและฝึกงานด้านวิศวกรรมซอฟต์แวร์',
          'ความมั่นคงปลอดภัยทางไซเบอร์เบื้องต้น',
          'ปัญญาประดิษฐ์และการเรียนรู้ของเครื่อง',
          'ธุรกิจสตาร์อัพด้านซอฟต์แวร์',
          'การออกแบบและพัฒนาโปรแกรมประยุกต์สำหรับอุปกรณ์เคลี่อนที่'
        ],
        'grades':   ['-', '-', '-', '-', '-', '-', '-', '-'],
      },
    };

    final subjects = subjectData[term]?['subjects'] as List<String>? ?? [];
    final grades = subjectData[term]?['grades'] as List<String>? ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('ผลการเรียน เทอม $term'),
        backgroundColor: Colors.teal[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.book, color: Colors.teal, size: 32),
                    SizedBox(width: 8),
                    Text('รายวิชาและผลการเรียน',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal[800])),
                  ],
                ),
                Divider(height: 32, thickness: 1),
                ...List.generate(subjects.length, (i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle_outline, color: Colors.teal[400], size: 20),
                        SizedBox(width: 8),
                        Expanded(child: Text(subjects[i], style: TextStyle(fontSize: 18))),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.teal[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(grades[i], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OutcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ตัวอย่างข้อมูลผลลัพธ์การเรียนรู้
    final outcomes = [
      'ปี 1: เรียนรู้ พื้นฐานด้านวิศวกรรมซอฟต์แวร์ การเขียนโปรแกรม ระบบปฏิบัติการ โครงสร้างข้อมูล สถาปัตยกรรมคอมพิวเตอร์',
      'ปี 2: เรียนรู้ การวิเคราะห์ ออกแบบ พัฒนาซอฟต์แวร์ การบำรุงรักษา การประกันคุณภาพ สถาปัตยกรรมซอฟต์แวร์ IOT และระบบฝังตัว',
      'ปี 3: กำลังเรียน',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('ผลลัพธ์การเรียนรู้'),
        backgroundColor: Colors.teal[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.emoji_objects, color: Colors.orange, size: 32),
                    SizedBox(width: 8),
                    Text('ผลลัพธ์การเรียนรู้',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal[800])),
                  ],
                ),
                Divider(height: 32, thickness: 1),
                ...outcomes.map((o) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_right, color: Colors.teal[400]),
                          SizedBox(width: 8),
                          Expanded(child: Text(o, style: TextStyle(fontSize: 18))),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('โปรไฟล์ส่วนตัว'),
        backgroundColor: Colors.teal[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('images/profile.jpg'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'นาย เลิศพิสิฐ ชัยงามเมือง',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal[900]),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'รหัสนักศึกษา: 66543210001-4',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  Divider(height: 32, thickness: 1),
                  ListTile(
                    leading: Icon(Icons.favorite, color: Colors.pink),
                    title: Text('ความชอบ'),
                    subtitle: Text('เล่นเกม'),
                  ),
                  ListTile(
                    leading: Icon(Icons.code, color: Colors.blue),
                    title: Text('ความถนัด'),
                    subtitle: Text('javascript, python'),
                  ),
                  ListTile(
                    leading: Icon(Icons.star, color: Colors.amber),
                    title: Text('ความสามารถพิเศษ'),
                    subtitle: Text('ไม่มี'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
