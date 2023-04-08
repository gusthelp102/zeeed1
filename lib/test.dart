// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class testing extends StatefulWidget {
//   const testing({Key? key}) : super(key: key);

//   @override
//   State<testing> createState() => _testingState();
// }

// class _testingState extends State<testing> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(backgroundColor: Color(0xFF9DB9CB), title: Text("data")),
//         body: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection('Merch').snapshots(),
//           builder: (context, snapshots) {
//             return (snapshots.connectionState == ConnectionState.waiting)
//                 ? Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : GridView.builder(
//                     itemCount: snapshots.data!.docs.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2),
//                     itemBuilder: (context, index) {
//                       var data = snapshots.data!.docs[index].data()
//                           as Map<String, dynamic>;
//                       return GridTile(
//                           child: GestureDetector(
//                         child: Container(
//                           child: Text("${data['name']}"),
//                           color: Colors.red,
//                           margin: EdgeInsets.all(8.0),
//                         ),
//                         onTap: () {
//                           print("object ${index}");
//                         },
//                       ));
//                     },
//                   );
//           },
//         ));
//   }
// }

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zeeed2/bidding_page/bidding_page_widget.dart';
import 'package:zeeed2/create_auction/create_auction_widget.dart';
import 'package:zeeed2/details_page.dart';
import 'package:zeeed2/flutter_flow/flutter_flow_util.dart';
import 'package:zeeed2/product_search/product_search.dart';
import 'package:zeeed2/profile/profile_widget.dart';
import 'package:zeeed2/search_user/search_user.dart';

import 'auth/auth_util.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'home_page/home_page_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final PageController pageController;
  ScrollController _scrollController = ScrollController();
  int pageNo = 0;

  Timer? carasouelTmer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 4) {
        pageNo = 0;
      }
      pageController.animateToPage(
        pageNo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNo++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    carasouelTmer = getTimer();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showBtmAppBr = false;
        setState(() {});
      } else {
        showBtmAppBr = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  bool showBtmAppBr = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const SizedBox(
                height: 2.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(7.0, 15.0, 7.0, 5.0),
                child: ListTile(
                  onTap: () {},
                  selected: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  selectedTileColor: Color(0xFF124C08),
                  title: Text(
                    "Welcome Back",
                    style: Theme.of(context).textTheme.subtitle1!.merge(
                          const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18.0,
                          ),
                        ),
                  ),
                  subtitle: AuthUserStreamWidget(
                    builder: (context) => Text(
                      '${currentUserDisplayName}',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF1E5D13),
                            fontSize: 22.0,
                          ),
                    ),
                  ),
                  trailing: PopUpMen(
                    menuList: [
                      PopupMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileWidget()));
                          },
                          child: ListTile(
                            leading: Icon(
                              CupertinoIcons.person,
                            ),
                            title: Text("My Profile"),
                          ),
                        ),
                      ),
                      // PopupMenuItem(
                      //   child: ListTile(
                      //     leading: Icon(
                      //       CupertinoIcons.bag,
                      //     ),
                      //     title: Text("My Bag"),
                      //   ),
                      // ),
                      PopupMenuDivider(),
                      PopupMenuItem(
                        child: Text("Settings"),
                      ),
                      PopupMenuItem(
                        child: Text("About Us"),
                      ),
                      PopupMenuDivider(),
                      PopupMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            // context.pushNamedAuth(
                            //   'HomePage',
                            //   mounted,
                            //   extra: <String, dynamic>{
                            //     kTransitionInfoKey: TransitionInfo(
                            //       hasTransition: true,
                            //       transitionType: PageTransitionType.fade,
                            //     ),
                            //   },
                            // );

                            // GoRouter.of(context).prepareAuthEvent();
                            // await signOut();

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => HomePageWidget()));
                            // signOut();
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.logout,
                            ),
                            title: Text("Log Out"),
                          ),
                        ),
                      ),
                    ],
                    icon: Icon(Icons.person, color: Colors.white, size: 33.0),
                    // CircleAvatar(
                    //   backgroundImage: const NetworkImage(
                    //     'https://images.unsplash.com/photo-1644982647869-e1337f992828?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
                    //   ),
                    // child: Container(),
                    // ),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    pageNo = index;
                    setState(() {});
                  },
                  itemBuilder: (_, index) {
                    return AnimatedBuilder(
                      animation: pageController,
                      builder: (ctx, child) {
                        return child!;
                      },
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("Hello you tapped at ${index + 1} "),
                            ),
                          );
                        },
                        onPanDown: (d) {
                          carasouelTmer?.cancel();
                          carasouelTmer = null;
                        },
                        onPanCancel: () {
                          carasouelTmer = getTimer();
                        },
                        child: Container(
                          child: Image.asset("assets/images/adhere.jpg"),
                          margin: const EdgeInsets.only(
                              right: 5, left: 5, top: 24, bottom: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            // color: Color(0xFF124C08),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 5,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.all(2.0),
                      child: Icon(
                        Icons.circle,
                        size: 12.0,
                        color: pageNo == index
                            ? Colors.indigoAccent
                            : Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: GridB(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: showBtmAppBr
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF124C08),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateAuctionWidget()));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        child: BottomAppBar(
          notchMargin: 8.0,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home_outlined,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.heart,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.settings,
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Container(
                        child: AlertDialog(
                          title: Text("What do you want to search ?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Search_user()));
                                },
                                child: Text("User")),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Product_search()));
                                },
                                child: Text("Product")),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(
                  CupertinoIcons.search,
                ),
              ),
            ],
          ),
        ),
        duration: const Duration(
          milliseconds: 800,
        ),
        curve: Curves.easeInOutSine,
        height: showBtmAppBr ? 70 : 0,
      ),
    );
  }
}

class PopUpMen extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;
  const PopUpMen({Key? key, required this.menuList, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      itemBuilder: ((context) => menuList),
      icon: icon,
    );
  }
}

class FabExt extends StatelessWidget {
  const FabExt({
    Key? key,
    required this.showFabTitle,
  }) : super(key: key);

  final bool showFabTitle;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: AnimatedContainer(
        duration: const Duration(seconds: 2),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const Icon(CupertinoIcons.cart),
            SizedBox(width: showFabTitle ? 12.0 : 0),
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              child: showFabTitle ? const Text("Go to cart") : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}

class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Merch').snapshots(),
        builder: (context, snapshots) {
          return (snapshots.connectionState == ConnectionState.waiting)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 15.0,
                    mainAxisExtent: 280,
                  ),
                  itemCount: snapshots.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshots.data!.docs[index].data()
                        as Map<String, dynamic>;
                    //////

                    return (data['price'].toString() == '999')
                        ? Center(
                            child: Text("data"),
                          )
                        : GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BiddingPageWidget(
                                            prod_index: index,
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  15.0,
                                ),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 15.0,
                                      offset: Offset(0.0, 0.75))
                                ],
                                color: Color(0xFF124C08),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.network(
                                      "${data['Photo']}",
                                      height: 170,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${data['name']}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .merge(
                                                const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(
                                          "${data['price']} KD",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .merge(
                                                TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey.shade500,
                                                ),
                                              ),
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(1.0),
                                          child: Text(
                                            "Ends at ${data['time']}",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                  },
                );
        });
  }
}
