import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
      appBar: CustomAppbar(
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
              stream: FirebaseFirestore.instance
                  .collection('test-book-collection')
                  .snapshots(),
              builder: (context, snapshots) {
                return (snapshots.connectionState == ConnectionState.waiting)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        //itemCount: (searchItem.isEmpty) ? (snapshots.data!.docs.length) : 1,
                        itemCount: snapshots.data!.docs.length,
                        itemBuilder: (context, index) {
                          var data = snapshots.data!.docs[index].data()
                              as Map<String, dynamic>;

                          if (searchItem.isEmpty) {
                            return ListTile(
                              title: Text(
                                data['bookName'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                data['bookId'].toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(data['bookImage']),
                              ),
                            );
                          }
                          else if (data['bookName'].toString().toLowerCase().contains(searchItem.toLowerCase())) {
                            return ListTile(
                              title: Text(
                                data['bookName'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                data['bookId'].toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(data['bookImage']),
                              ),
                            );
                          }
                          else {
                          //return const Text('Cannot found what you are searching for :(', textAlign: TextAlign.center,);
                          return Container();
                        }
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
