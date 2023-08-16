import 'package:flutter/material.dart';

import '../../widget/offer_row.dart';

class PendingOffers extends StatefulWidget {
  const PendingOffers({super.key});

  @override
  State<PendingOffers> createState() => _PendingOffersState();
}

class _PendingOffersState extends State<PendingOffers> {
  @override
  Widget build(BuildContext context) {
    return   ListView.builder(
      shrinkWrap: true,
      itemCount: 20,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
            height: MediaQuery.of(context).size.height/6,
            child: OfferRow(index: index,));
      },

    ) ;
  }
}
