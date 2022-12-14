import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kitapp/view/shared/styles/colors.dart';

import '../../../shared/widgets/custom_appbar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchItem = "";

  // List<Map<String, dynamic>> data = [
  //   {
  //     'bookId': 1,
  //     'bookName': 'Book One',
  //     'bookImage':
  //         'https://i.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
  //   },
  //   {
  //     'bookId': 2,
  //     'bookName': 'Book Two',
  //     'bookImage':
  //         'https://i.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
  //   },
  //   {
  //     'bookId': 3,
  //     'bookName': 'Book Three',
  //     'bookImage':
  //         'https://i.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
  //   },
  //   {
  //     'bookId': 4,
  //     'bookName': 'Book Four',
  //     'bookImage':
  //         'https://i.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
  //   },
  //   {
  //     'bookId': 5,
  //     'bookName': 'Book Five',
  //     'bookImage':
  //         'https://i.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
  //   },
  //   {
  //     'bookId': 6,
  //     'bookName': 'Book Six',
  //     'bookImage':
  //         'https://i.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
  //   },
  //   {
  //     'bookId': 7,
  //     'bookName': 'Book Seven',
  //     'bookImage':
  //         'https://i.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
  //   },
  //   {
  //     'bookId': 8,
  //     'bookName': 'Book Eight',
  //     'bookImage':
  //         'https://i.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
  //   },
  //   {
  //     'bookId': 9,
  //     'bookName': 'Book Nine',
  //     'bookImage':
  //         'https://i.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
  //   },
  //   {
  //     'bookId': 10,
  //     'bookName': 'Book Ten',
  //     'bookImage':
  //         'https://i.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
  //   }
  // ];

  // addData() async {
  //   for (var element in data) {
  //     FirebaseFirestore.instance
  //         .collection('test-book-collection')
  //         .add(element);
  //   }
  // }

  // @override
  // void initState() {
  // ignore: todo
  //   // TODO: implement initState
  //   super.initState();
  //   addData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Search Page',
        showBackButton: false,
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search for books or authors'),
            onChanged: (val) {
              setState(() {
                searchItem = val;
              });
            },
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('books').snapshots(),
              builder: (context, snapshots) {
                if (snapshots.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshots.hasData) {
                  return ListView.builder(
                    //itemCount: (searchItem.isEmpty) ? (snapshots.data!.docs.length) : 1,
                    itemCount: snapshots.data?.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshots.data!.docs[index].data()
                          as Map<String, dynamic>;
                      if (searchItem.isEmpty) {
                        return ListTile(
                          title: Text(
                            data['nameOfBook'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            data['author'].toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(data['coverImageUrl']),
                          ),
                          trailing: const Icon(Icons.star_border_rounded,
                              color: AppColors.primary),
                        );
                      } else if (data['nameOfBook']
                              .toString()
                              .toLowerCase()
                              .contains(searchItem.toLowerCase()) ||
                          data['author']
                              .toString()
                              .toLowerCase()
                              .contains(searchItem.toLowerCase())) {
                        // return Card(
                        //   child: Row(
                        //     children: [
                        //       Container(
                        //           //height: 100,
                        //           decoration: BoxDecoration(
                        //             image: DecorationImage(
                        //               image: NetworkImage(data['coverImageUrl']),
                        //               fit: BoxFit.fitHeight
                        //             ),
                        //           ),
                        //           ),
                        //       SizedBox(
                        //         width: 400,
                        //         height: 100,
                        //         child: ListTile(
                        //           title: Text(data['nameOfBook']),
                        //           subtitle: Text(data['author']),
                        //           trailing: Icon(Icons.star_border_rounded),//Icons.star_rate_rounded
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // );
                        return ListTile(
                          title: Text(
                            data['nameOfBook'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            data['author'].toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(data['coverImageUrl']),
                          ),
                          trailing: const Icon(Icons.star_border_rounded,
                              color:
                                  AppColors.primary), //Icons.star_rate_rounded
                        );
                      } else {
                        //return const Text('Cannot found what you are searching for :(', textAlign: TextAlign.center,);
                        return Container();
                      }
                    },
                  );
                } else {
                  return const Text("Burdayım");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
