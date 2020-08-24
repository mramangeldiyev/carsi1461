// import 'package:carsi1461/widgets/insan_kaynaklari_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class InsanKaynaklariScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final title = 'Haberler';

//     return MaterialApp(
//       title: title,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: Text(
//             title,
//             style: TextStyle(color: Colors.black),
//           ),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back, color: Colors.black),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//         ),
//         body: ListView(
//           children: <Widget>[
//             FutureBuilder<List>(
//               future: fetchInsanKaynaklari(http.Client()),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return Column(
//                     children: <Widget>[
//                       for (var i in snapshot.data)
//                       GestureDetector(
//                         onTap: null,
//                         child: newsInsanKaynaklari(i),
//                       )
//                     ],
//                   );
//                 } else {
//                   return Text('Yukleniyor');
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Stack newsCarousell(News data) {
// //   return Stack(
// //     alignment: Alignment.center,
// //     children: <Widget>[
// //       ClipRRect(
// //         //borderRadius: BorderRadius.all(Radius.circular(8)),
// //         child: Image.network(
// //             'http://carsi1461.com/' + data.news_image,
// //             fit: BoxFit.cover,
// //           ),
// //       ),
// //       Container(
// //         margin: EdgeInsets.only(left: 11, right: 11),
// //         decoration: BoxDecoration(
// //           borderRadius: BorderRadius.circular(8),
// //           gradient: LinearGradient(
// //             begin: Alignment.topCenter,
// //             end: Alignment.bottomCenter,
// //             colors: [
// //               const Color(0x00000000),
// //               const Color(0x00000000),
// //               const Color(0x00000000),
// //               const Color(0xCC000000),
// //             ],
// //           ),
// //         ),
// //       ),
// //       Positioned(
// //         left: 20,
// //         bottom: 10,
// //         right: 10,
// //         child: Text(
// //           data.news_title,
// //           style: TextStyle(
// //             color: Colors.white,
// //             fontSize: 20,
// //           ),
// //           maxLines: 2,
// //         ),
// //       ),
// //       // ListTile(
// //       //   title: Text(data.news_title),
// //       // ),
// //     ],
// //   );
// // }

// Container newsInsanKaynaklari(InsanKaynaklari data) {
//   return Container(
//     margin: EdgeInsets.all(8.0),
//     child: Card(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(8.0))),
//       child: InkWell(
//         // onTap: () {
//         //   print('asd');
//         // },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch, // add this
//           children: <Widget>[
//             ListTile(
//               title: Text(
//                 'Şirket: ${data.name}',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             ListTile(
//               title: Text(
//                 'Adres: ${data.adres}',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             ListTile(
//               title: Text(
//                 'Pozisyon: ${data.pozisyon}',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             ListTile(
//               title: Text(
//                 'Poziyon: ${data.telefon}',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }