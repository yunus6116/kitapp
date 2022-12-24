import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/core/extensions/context_extensions.dart';
import 'package:kitapp/core/global_models/book_model/book_model.dart';
import 'package:kitapp/core/routing/router.gr.dart';
import '../../../shared/styles/colors.dart';

import '../../../shared/widgets/app_icons.dart';
import '../../../shared/widgets/custom_appbar.dart';

class SearchPage extends StatefulHookConsumerWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final _controller = TextEditingController();
  String searchItem = "";
  List<BookModel> allBooks = [];
  List<BookModel> categorizedBook = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleWidget: const Text(
        'Search & Book Categories',
        style: TextStyle(color: AppColors.primary, fontSize: 21),
      )),
      body: Column(
        children: [
          searchBar(context),
          FutureBuilder(
            future: FirebaseFirestore.instance.collection('books').get(),
            builder: (context, snapshot) {
              //If snapshot has error
              if (snapshot.hasError) {
                return const Text('Snapshot has error!');
              }
              //If connection is provided
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  for (var book in snapshot.data!.docs) {
                    BookModel currentBook = BookModel.fromMap(book.data());
                    allBooks.add(currentBook);
                  }
                  return Expanded(
                      child: searchItem.isEmpty
                          ? getCategories(allBooks)
                          : getBooks(searchItem));
                }
              }
              //If connection is waiting
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }

  Container searchBar(BuildContext context) {
    var textFieldLRMargin = MediaQuery.of(context).size.width / 18.75;
    var textFieldTMargin = MediaQuery.of(context).size.width / 59.19;
    var textFieldBMargin = MediaQuery.of(context).size.width / 39.46; //39.46
    var textFieldHeight = MediaQuery.of(context).size.height / 18.68; //23.68
    return Container(
      margin: EdgeInsets.fromLTRB(textFieldLRMargin, textFieldTMargin,
          textFieldLRMargin, textFieldBMargin),
      height: textFieldHeight,
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          enabledBorder: textFieldBorder(),
          focusedBorder: textFieldBorder(),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: searchItem.isEmpty
              ? null
              : IconButton(
                  icon: const AppIcons(
                    iconType: IconType.clearTextIcon,
                    iconColor: Color(0xff4D506C),
                    width: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      searchItem = '';
                      _controller.clear();
                    });
                  },
                ),
          hintText: 'Search for books or authors',
          prefixIconColor: context.theme.secondaryHeaderColor,
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: (val) {
          setState(() {
            searchItem = val;
          });
        },
      ),
    );
  }

  OutlineInputBorder textFieldBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color(0xff4D506C),
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),
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
            for (var book in snapshot.data!.docs) {
              BookModel currentBook =
                  BookModel.fromMap(book.data() as Map<String, dynamic>);
              allBooks.add(currentBook);
            }
            return CupertinoScrollbar(
              controller: controllerOne,
              thickness: 5.0,
              child: ListView.builder(
                controller: controllerOne,
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  var data =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  BookModel currentBook = BookModel.fromMap(data);
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
                      onTap: () {
                        context.router
                            .navigate(BookDetailRoute(book: currentBook));
                      },
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

  Widget getCategories(List<BookModel> bookList) {
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

                      return InkWell(
                        onTap: () {
                          String categoryName =
                              getCategoryName(ref, returnText: true);
                          categorizedBook = [];
                          for (var book in bookList) {
                            if (book.category!.toLowerCase() ==
                                categoryName.toLowerCase()) {
                              if (!categorizedBook.contains(book)) {
                                categorizedBook.add(book);
                              }
                            }
                          }
                          context.router.navigate(BookGridListRoute(
                            title: categoryName,
                            bookList: categorizedBook,
                          ));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 54, 54, 54),
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.6),
                                  BlendMode.dstATop),
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
                        ),
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

  dynamic getCategoryName(ref, {bool returnText = false}) {
    Map<String, String> categoryMapping = {
      'classics': 'Classics',
      'adventure': 'Adventure',
      'child': 'Child',
      'detectiveFiction': 'Detective Fiction',
      'dictionary': 'Dictionary',
      'history': 'History',
      'scienceFiction': 'Science Fiction',
    };
    String? categoryName = 'Classics';
    var name = ref.id;
    for (String i in categoryMapping.keys) {
      if (i == name) {
        categoryName = categoryMapping[i];
      }
    }
    if (returnText) {
      return categoryName ?? 'Category Page';
    }
    return Text(
      categoryName!,
      style: const TextStyle(
        color: Color(0xfff5f5f5),
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
