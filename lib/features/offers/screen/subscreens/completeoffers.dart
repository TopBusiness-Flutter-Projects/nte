import 'package:flutter/material.dart';

import '../../widget/offer_row.dart';

class CompletedOffers extends StatefulWidget {
  const CompletedOffers({super.key});

  @override
  State<CompletedOffers> createState() => _CompletedOffersState();
}

class _CompletedOffersState extends State<CompletedOffers> {
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
