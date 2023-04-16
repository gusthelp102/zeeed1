import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zeeed2/profile/other_profile_widget.dart';

class Search_user extends StatefulWidget {
  const Search_user({Key? key}) : super(key: key);

  @override
  State<Search_user> createState() => _Search_userState();
}

class _Search_userState extends State<Search_user> {
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFF9DB9CB),
            title: Card(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search), hintText: 'User Search...'),
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
              ),
            )),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Users').snapshots(),
          builder: (context, snapshots) {
            return (snapshots.connectionState == ConnectionState.waiting)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snapshots.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshots.data!.docs[index].data()
                          as Map<String, dynamic>;
                      if (snapshots.connectionState ==
                          ConnectionState.waiting) {
                        return Container();
                      } else if (name.isEmpty) {
                        return ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    OtherProfileWidget(email: data['email'])));
                          },
                          title: Text(
                            data['display_name'] ?? 'name',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            data['email'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(data['photo_url'] ==
                                        '' ||
                                    data['photo_url'] == null
                                ? 'https://firebasestorage.googleapis.com/v0/b/zeeed2-38d64.appspot.com/o/profile_default_image.jpg?alt=media&token=4e9f6b60-5ee9-4d86-b84e-24d9e143e5a9'
                                : data['photo_url']),
                          ),
                        );
                      }
                      if (data['display_name']
                          .toString()
                          .toLowerCase()
                          .startsWith(name.toLowerCase())) {
                        return ListTile(
                          title: Text(
                            data['display_name'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            data['email'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(data['photo_url']),
                          ),
                        );
                      }
                      return Container();
                    });
          },
        ));
  }
}
