// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ImageUploadScreen extends StatefulWidget {
//   const ImageUploadScreen({Key? key}) : super(key: key);
//
//   @override
//   _ImageUploadScreenState createState() => _ImageUploadScreenState();
// }
//
// class _ImageUploadScreenState extends State<ImageUploadScreen> {
//   late ImagePicker _imagePicker;
//
//   @override
//   void initState() {
//     super.initState();
//     _imagePicker = ImagePicker();
//   }
//
//   Future<void> _pickImage(ImageSource source) async {
//     XFile? pickedFile = await _imagePicker.pickImage(source: source);
//     setState(() {
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showModalBottomSheet(
//           context: context,
//           builder: (BuildContext context) {
//             return Container(
//               height: 120,
//               child: Column(
//                 children: <Widget>[
//                   ListTile(
//                     leading: Icon(Icons.camera),
//                     title: Text('Camera'),
//                     onTap: () {
//                       _pickImage(ImageSource.camera);
//                       Navigator.pop(context);
//                     },
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.photo),
//                     title: Text('Gallery'),
//                     onTap: () {
//                       _pickImage(ImageSource.gallery);
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//       child: Container(
//         height: 160,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.black12, width: 1),
//           color: Colors.grey[300],
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.file_upload_outlined,
//                 size: 30, color: Color(0xff888383)),
//             SizedBox(height: 10),
//             Text(
//               'Upload the Image',
//               style: TextStyle(
//                 color: Color(0xff888383),
//                 fontFamily: 'Poppins',
//                 fontSize: 13,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
