import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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
              stream:
                  FirebaseFirestore.instance.collection('books').snapshots(),
              builder: (context, snapshots) {
                if (snapshots.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshots.hasData) {
                  final ScrollController controllerOne = ScrollController();
                  return CupertinoScrollbar(
                    controller: controllerOne,
                    thickness: 5.0,
                    child: ListView.builder(
                      controller: controllerOne,
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
                        } 
                        else if (data['nameOfBook']
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
                    ),
                  );
                } else {
                  return const Text("streamde data yok");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
