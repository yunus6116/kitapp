import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              child:
                  searchItem.isEmpty ? getCategories() : getBooks(searchItem)),
        ],
      ),
    );
  }
}

Widget getCategories() {
  return FutureBuilder<dynamic>(
    future: FirebaseFirestore.instance.collection('categories').get(),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if (snapshot.hasError) {
        return const Text('Snapshot has error!');
      }
      if (snapshot.connectionState == ConnectionState.done) {
        final ScrollController controllerOne = ScrollController();
        return CupertinoScrollbar(
          controller: controllerOne,
          thickness: 5.0,
          child: Column(
            children: [
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  controller: controllerOne,
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;
                    var ref = snapshot.data!.docs[index];

                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(data['categoryImage']),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: double.maxFinite,
                      child: Center(child: getCategoryName(ref)),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }
      //If connection is waiting
      return const Center(child: CircularProgressIndicator());
    },
  );
}

Widget getCategoryName(ref) {
  Map<String, String> categoryMapping = {
    'classics': 'Classics',
    'adventure': 'Adventure',
    'child': 'Child',
    'detectiveFiction': 'Detective Fiction',
    'dictionary': 'Dictionary',
    'history': 'History',
    'scienceFiction': 'Science Fiction',
  };
  String? categoryName = 'Category Name Here!';
  var name = ref.id;
  for (String i in categoryMapping.keys) {
    if (i == name) {
      categoryName = categoryMapping[i];
    }
  }
  return Text(
    categoryName!,
    style: const TextStyle(
      color: Color(0xfff5f5f5),
    ),
  );
}

Widget getBooks(String searchItem) {
  return FutureBuilder<dynamic>(
    future: FirebaseFirestore.instance.collection('books').get(),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      //If snapshot has error
      if (snapshot.hasError) {
        return const Text('Snapshot has error!');
      }
      //If connection is provided
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasData) {
          final ScrollController controllerOne = ScrollController();
          return CupertinoScrollbar(
            controller: controllerOne,
            thickness: 5.0,
            child: ListView.builder(
              controller: controllerOne,
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                var data =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                //User is typing
                if (data['nameOfBook']
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
                      backgroundImage: NetworkImage(data['coverImageUrl']),
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
  );
}