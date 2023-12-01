// // ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// import 'package:booking/components/btn/button_primary.dart';
// import 'package:flutter/material.dart';

// class SelectPerson extends StatefulWidget {
//   SelectPerson({
//     Key? key,
//     required this.room,
//     this.setParentState,
//   }) : super(key: key);
//   int room;
//   void Function()? setParentState;

//   @override
//   State<SelectPerson> createState() => _SelectPersonState();
// }

// class _SelectPersonState extends State<SelectPerson> {
//   @override
//   Widget build(BuildContext context) {
//     return StatefulBuilder(
//       builder: (context, setModalState) {
//         return Container(
//           padding: const EdgeInsets.all(16),
//           height: MediaQuery.of(context).size.height * 3 / 4,
//           width: double.infinity,
//           child: Column(
//             children: [
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 child: Text('Chọn số phòng và khách'),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: const [
//                       Icon(Icons.door_sliding),
//                       SizedBox(width: 10),
//                       Text('Phòng'),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           setModalState(() {});
//                           if (widget.room > 0) {
//                             widget.setParentState!(() {
//                               widget.room -= 1;
//                             });
//                           }
//                         },
//                         child: const Icon(Icons.add),
//                       ),
//                       const SizedBox(width: 5),
//                       ElevatedButton(
//                         onPressed: () {},
//                         child: Text('${widget.room}'),
//                       ),
//                       const SizedBox(width: 5),
//                       ElevatedButton(
//                         onPressed: () {
//                           setModalState(() {});
//                           setState(() {
//                             widget.room += 1;
//                           });
//                         },
//                         child: const Icon(Icons.add),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               ButtonPrimary(
//                 text: 'Ok',
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
