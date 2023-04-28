import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zeeed2/auth/auth_util.dart';
import 'package:zeeed2/bid_history/edit_auction2.dart';
import 'package:zeeed2/bid_history/view_bid_history.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1E5D13),
        title: Text(
          'About Us',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
        ),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(children: [
          Text(
            '''
            Auctions have been recorded as early as 500 BC.[3] According to Herodotus, in Babylon, auctions of women for marriage were held annually. The auctions began with the woman the auctioneer considered to be the most beautiful and progressed to the least beautiful. It was considered illegal to allow a daughter to be sold outside of the auction method.[4] Attractive maidens were offered in a forward auction to determine the price to be paid by a swain, while unattractive maidens required a reverse auction to determine the price to be paid to a swain.[5]
      
      Auctions took place in Ancient Greece, other Hellenistic societies, and also in Rome.[6] During the Roman Empire, after a military victory, Roman soldiers would often drive a spear into the ground around which the spoils of war were left, to be auctioned off. Slaves, often captured as the "spoils of war", were auctioned in the Forum under the sign of the spear, with the proceeds of sale going toward the war effort.[4]
      
      The Romans also used auctions to liquidate the assets of debtors whose property had been confiscated.[7] For example, Marcus Aurelius sold household furniture to pay off debts, the sales lasting for months.[8] One of the most significant historical auctions occurred in 193 AD when the entire Roman Empire was put on the auction block by the Praetorian Guard. On 28 March 193, the Praetorian Guard first killed emperor Pertinax, then offered the empire to the highest bidder. Didius Julianus won the auction for the price of 6,250 drachmas per guard,[9][10][11] an act that initiated a brief civil war. Didius was then beheaded two months later when Septimius Severus conquered Rome.[7]
      
      From the end of the Roman Empire to the 18th century, auctions lost favor in Europe,[7] while they had never been widespread in Asia.[4] In China, the personal belongings of deceased Buddhist monks were sold at auction as early as seventh century AD.[5]
          ''',
            style: TextStyle(fontSize: 20),
          )
        ]),
      ),
    );
  }
}
