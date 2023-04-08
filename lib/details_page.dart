import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zeeed2/backend/backend.dart';
import 'auth/auth_util.dart';
import 'package:firebase_database/firebase_database.dart';

class Detailspage extends StatelessWidget {
  Detailspage({Key? key}) : super(key: key);

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
                                            "${data['time']}",
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
