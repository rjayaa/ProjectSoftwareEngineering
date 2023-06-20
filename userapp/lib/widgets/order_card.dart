import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:userapp/models/items.dart';

class OrderCard extends StatelessWidget {
  final int? itemCount;
  final List<DocumentSnapshot>? data;
  final String? orderID;
  final List<String>? seperateQuantitiesList;

  OrderCard({
    this.itemCount,
    this.data,
    this.orderID,
    this.seperateQuantitiesList,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // todo
      },
      child: Container(
        color: Color.fromARGB(255, 64, 64, 64),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        height: itemCount! * 125,
        child: ListView.builder(
          itemCount: itemCount,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            Items model =
                Items.fromJson(data![index].data()! as Map<String, dynamic>);
            return placedOrderDesignWidget(
                model, context, seperateQuantitiesList![index]);
          },
        ),
      ),
    );
  }
}

Widget placedOrderDesignWidget(
    Items model, BuildContext context, seperateQuantitiesList) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 80,
    // color: Colors.white70,
    child: Row(
      children: [
        Image.network(
          model.thumbnailUrl!,
          width: 120,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Text(model.title!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Poppins",
                          ))),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Rp ",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    model.price.toString(),
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "x ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      seperateQuantitiesList,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import '../models/Items.dart';

// class OrderCard extends StatelessWidget {
//   final int? itemCount;
//   final List<DocumentSnapshot>? data;
//   final String? orderID;
//   final List<String>? seperateQuantitiesList;

//   OrderCard({
//     this.itemCount,
//     this.data,
//     this.orderID,
//     this.seperateQuantitiesList,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         //todo
//       },
//       child: Container(
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//           colors: [
//             Colors.black12,
//             Colors.white54,
//           ],
//           begin: FractionalOffset(0.0, 0.0),
//           end: FractionalOffset(1.0, 0.0),
//           stops: [0.0, 1.0],
//           tileMode: TileMode.clamp,
//         )),
//         padding: const EdgeInsets.all(10),
//         margin: const EdgeInsets.all(10),
//         height: itemCount! * 125,
//         child: ListView.builder(
//           itemCount: itemCount,
//           physics: NeverScrollableScrollPhysics(),
//           itemBuilder: (context, index) {
//             Items model =
//                 Items.fromJson(data![index].data()! as Map<String, dynamic>);
//             return placedOrderDesignWidget(
//                 model, context, seperateQuantitiesList![index]);
//           },
//         ),
//       ),
//     );
//   }
// }

// Widget placedOrderDesignWidget(
//     Items model, BuildContext context, seperateQuantitiesList) {
//   return Container(
//     width: MediaQuery.of(context).size.width,
//     height: 120,
//     color: Colors.grey[200],
//     child: Row(
//       children: [
//         Image.network(
//           model.thumbnailUrl!,
//           width: 120,
//         ),
//         const SizedBox(
//           width: 10.0,
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Expanded(
//                     child: Text(
//                       model.title!,
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontSize: 16,
//                         fontFamily: "Acme",
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   const Text(
//                     "€ ",
//                     style: TextStyle(fontSize: 16.0, color: Colors.blue),
//                   ),
//                   Text(
//                     model.price.toString(),
//                     style: const TextStyle(
//                       color: Colors.blue,
//                       fontSize: 18.0,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//                   const Text(
//                     "x ",
//                     style: TextStyle(
//                       color: Colors.black54,
//                       fontSize: 14,
//                     ),
//                   ),
//                   Expanded(
//                     child: Text(
//                       seperateQuantitiesList,
//                       style: const TextStyle(
//                         color: Colors.black54,
//                         fontSize: 30,
//                         fontFamily: "Acme",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
