import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zeeed2/create_auction/create_auction_widget.dart';
import 'package:zeeed2/flutter_flow/flutter_flow_icon_button.dart';
import 'package:zeeed2/flutter_flow/flutter_flow_theme.dart';
import 'package:zeeed2/flutter_flow/flutter_flow_util.dart';

class EditAuction2 extends StatefulWidget {
  EditAuction2({Key? key, required this.photo}) : super(key: key);

  String photo;

  @override
  State<EditAuction2> createState() => _EditAuction2State(photo: photo);
}

class _EditAuction2State extends State<EditAuction2> {
  _EditAuction2State({required this.photo});

  String photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF459B38),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
        title: Align(
          alignment: AlignmentDirectional(-0.3, 0.0),
          child: Text(
            'Auction',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                ),
          ),
        ),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Merch')
            .where('Photo', isEqualTo: photo)
            .snapshots(),
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
                    if (snapshots.connectionState == ConnectionState.waiting) {
                      return Container();
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 300,
                              height: 300,
                              child: Image.network(data['Photo']),
                            ),
                            Container(height: 20),
                            Text(
                              data['name'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(height: 20),
                            Text(
                              data['description'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(height: 20),
                            Text(
                              'Amount: ${data['price']} KD',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(height: 20),
                            Text(
                              'date: ${data['time']}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(height: 20),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CreateAuctionWidget()));
                                },
                                child: Text('Edit'))
                          ],
                        ),
                      );
                    }
                  });
        },
      ),
    );
  }
}
