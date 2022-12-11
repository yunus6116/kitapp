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
            child: FutureBuilder<dynamic>(
              future: FirebaseFirestore.instance.collection('books').get(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                //If snapshot has error
                if (snapshot.hasError) {
                  return const Text('Snapshot has error!');
                }

                //If connection is provided
                if (snapshot.connectionState == ConnectionState.done) {
                  //If data and document exist
                  if (snapshot.hasData) {
                    final ScrollController controllerOne = ScrollController();
                    return CupertinoScrollbar(
                      controller: controllerOne,
                      thickness: 5.0,
                      child: ListView.builder(
                        controller: controllerOne,
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data!.docs[index].data()
                              as Map<String, dynamic>;

                          //User has not typed yet -> (TEMPORARY) Show all / () Show categories
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
                            );
                          }

                          //User is typing
                          else if (data['nameOfBook']
                                  .toString()
                                  .toLowerCase()
                                  .contains(searchItem.toLowerCase()) ||
                              data['author']
                                  .toString()
                                  .toLowerCase()
                                  .contains(searchItem.toLowerCase())) {
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
                            );
                          }

                          //For the books/authors that does not match with searchItem
                          else {
                            return Container();
                          }
                        },
                      ),
                    );
                  }
                }

                //If connection is waiting
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
